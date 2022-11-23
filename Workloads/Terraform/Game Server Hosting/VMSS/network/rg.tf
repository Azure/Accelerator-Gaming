resource "azurerm_resource_group" "rg_network" {
  name     = "rg=${var.workload_name}-${var.environment}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}