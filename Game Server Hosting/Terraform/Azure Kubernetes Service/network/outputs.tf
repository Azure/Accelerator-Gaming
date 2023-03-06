output "spoke_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}
output "subnet_id" {
  value = azurerm_subnet.spoke_subnet.id
}
output "default_node_pip_prefix_id" {
  value = azurerm_public_ip_prefix.default_node_pip_prefix.id
}
output "node_pip_prefix_id" {
  value = azurerm_public_ip_prefix.node_pip_prefix.id
}