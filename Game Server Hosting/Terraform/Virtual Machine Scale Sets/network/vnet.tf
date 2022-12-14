# Calling the Hub Vnet that is already created
data "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_vnet_name
  resource_group_name = var.resource_group_name
}

# Creating the Spoke VNet, Subnet, and NSG for your VMSS
resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  address_space       = var.spoke_vnet_address_space
  tags                = var.resource_tags
}

resource "azurerm_subnet" "spoke_subnet" {
  name                 = var.spoke_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = var.subnet_address_prefix
}

resource "azurerm_subnet_network_security_group_association" "spoke_subnet_nsg" {
  subnet_id                 = azurerm_subnet.spoke_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Creating the Peering between your Hub Vnet and Spoke Vnet
resource "azurerm_virtual_network_peering" "peer1" {
  name                         = var.peer1_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = true
}

resource "azurerm_virtual_network_peering" "peer2" {
  name                         = var.peer2_name
  resource_group_name          = var.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = true
}

