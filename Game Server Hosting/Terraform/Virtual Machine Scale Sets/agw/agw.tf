resource "azurerm_resource_group" "rg_agw" {
  name = var.agw_rg_name
  location = var.resource_location
  tags = var.resource_tags
}