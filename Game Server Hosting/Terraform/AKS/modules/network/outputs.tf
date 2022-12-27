output "spoke_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}
output "subnet_id" {
  value = azurerm_subnet.spoke_subnet.id
}



