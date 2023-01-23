resource "azurerm_resource_group" "rg_insights" {
  name     = "rg-insights-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}
resource "azurerm_log_analytics_workspace" "aks_law" {
  name                = "law-aks-${var.prefix}-${var.resource_location}"
  location            = var.resource_location
  resource_group_name = azurerm_resource_group.rg_insights.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
resource "azurerm_log_analytics_solution" "aks_law_solution" {
  solution_name         = "ContainerInsights"
  location              = var.resource_location
  resource_group_name   = azurerm_resource_group.rg_insights.name
  workspace_resource_id = azurerm_log_analytics_workspace.aks_law.id
  workspace_name        = azurerm_log_analytics_workspace.aks_law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

