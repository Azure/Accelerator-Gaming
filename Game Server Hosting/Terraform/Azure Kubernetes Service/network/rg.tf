resource "azurerm_resource_group" "rg_network" {
  name     = "rg-net-aks-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}