// Create Resource Group for AKS Cluster
resource "azurerm_resource_group" "rg_aks" {
  name     = "rg-aks-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}

// Create a Resource Group for Nodes
resource "azurerm_resource_group" "rg_aks_nodes" {
  name     = "rg-aks-nodes-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}