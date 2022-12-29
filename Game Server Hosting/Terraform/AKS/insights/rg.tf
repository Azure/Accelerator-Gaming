resource "azurerm_resource_group" "rg_insights" {
  name     = var.rg_insights
  location = var.resource_location
  tags     = var.resource_tags
}
  