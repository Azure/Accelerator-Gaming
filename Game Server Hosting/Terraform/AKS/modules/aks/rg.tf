resource "azurerm_resource_group" "rg_vmss" {
  name     = var.rg_aks
  location = var.resource_location
  tags     = var.resource_tags
}
