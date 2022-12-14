resource "azurerm_resource_group" "rg_network" {
  name     = var.resource_group_name
  location = var.resource_location
  tags     = var.resource_tags
}