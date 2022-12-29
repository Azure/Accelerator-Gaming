resource "azurerm_log_analytics_workspace" "aks_law" {
  name                = var.law_name
  location            = var.resource_location
  resource_group_name = var.rg_insights
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
resource "azurerm_log_analytics_solution" "aks_law_solution" {
  solution_name         = var.law_solution_name
  location              = var.resource_location
  resource_group_name   = var.rg_insights
  workspace_resource_id = azurerm_log_analytics_workspace.aks_law.id
  workspace_name        = azurerm_log_analytics_workspace.aks_law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

