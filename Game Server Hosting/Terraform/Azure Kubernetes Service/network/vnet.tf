// Creating the Spoke VNet, Subnet, and Public IP for your AKS Cluster
resource "azurerm_virtual_network" "spoke_vnet" {
  name                = "vnet-aks-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = var.spoke_vnet_address_space
  tags                = azurerm_resource_group.rg_network.tags
}
resource "azurerm_public_ip_prefix" "default_node_pip_prefix" {
  name                = "pip-aks-dnp-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  prefix_length       = 28
  sku                 = "Standard"
  tags                = azurerm_resource_group.rg_network.tags
}
resource "azurerm_public_ip_prefix" "node_pip_prefix" {
  name                = "pip-aks-np-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  prefix_length       = 28
  sku                 = "Standard"
  tags                = azurerm_resource_group.rg_network.tags
}
resource "azurerm_subnet" "spoke_subnet" {
  name                 = "subnet-aks-${var.prefix}-${var.resource_location}"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_address_prefix
}

/*
  resource "azurerm_subnet_network_security_group_association" "spoke_subnet_nsg" {
  subnet_id                 = azurerm_subnet.spoke_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
*/

// Creating the Peering between your Hub Vnet and Spoke Vnet
resource "azurerm_virtual_network_peering" "peer1" {
  name                         = "peer1-${var.prefix}-${var.resource_location}"
  resource_group_name          = azurerm_resource_group.rg_network.name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false /* Set to True if you are peering to a Hub with a Gateway */
}
resource "azurerm_virtual_network_peering" "peer2" {
  name                         = "peer2-${var.prefix}-${var.resource_location}"
  resource_group_name          = var.rg_hub
  virtual_network_name         = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false /* Set to True if you have a Gateway in your Hub network */
  use_remote_gateways          = false
}

