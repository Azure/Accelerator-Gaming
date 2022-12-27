resource "azurerm_resource_group" "rg_network" {
  name     = var.rg_spoke
  location = var.resource_location
  tags     = var.resource_tags
}