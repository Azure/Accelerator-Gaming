resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  tags                = var.resource_tags
  security_rule {
    name                       = "Allow-RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
}