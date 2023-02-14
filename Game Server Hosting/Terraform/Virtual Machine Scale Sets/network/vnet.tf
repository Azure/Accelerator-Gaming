resource "azurerm_resource_group" "rg_net" {
  name     = "rg-net-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags

} # Creating the Spoke VNet, Subnet, and NSG for your VMSS
resource "azurerm_virtual_network" "spoke_vnet" {
  name                = "vnet-vmss-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_net.location
  resource_group_name = azurerm_resource_group.rg_net.name
  address_space       = var.spoke_vnet_address_space
  tags                = var.resource_tags
}

resource "azurerm_public_ip_prefix" "vmss_pip_prefix" {
  name                = "pip-vmss-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_net.location
  resource_group_name = azurerm_resource_group.rg_net.name
  tags                = var.resource_tags
  prefix_length       = 28
}

resource "azurerm_subnet" "spoke_subnet" {
  name                 = "subnet-vmss-${var.prefix}-${var.resource_location}"
  resource_group_name  = azurerm_resource_group.rg_net.name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_subnet_network_security_group_association" "spoke_subnet_nsg" {
  subnet_id                 = azurerm_subnet.spoke_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Creating the Peering between your Hub Vnet and Spoke Vnet
resource "azurerm_virtual_network_peering" "peer1" {
  name                         = "peer1-${var.prefix}-${var.resource_location}"
  resource_group_name          = azurerm_resource_group.rg_net.name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true
}

resource "azurerm_virtual_network_peering" "peer2" {
  name                         = "peer2-${var.prefix}-${var.resource_location}"
  resource_group_name          = var.rg_hub
  virtual_network_name         = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false
}

