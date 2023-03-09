// Create an Azure Dedicated Host Group for AKS Cluseter
resource "azurerm_dedicated_host_group" "dhg" {
  name                        = "dhg-aks-${var.prefix}-${var.resource_location}"
  location                    = azurerm_resource_group.rg_aks.location
  resource_group_name         = azurerm_resource_group.rg_aks.name
  platform_fault_domain_count = 2
  automatic_placement_enabled = true
  tags                        = azurerm_resource_group.rg_aks.tags
}

// Create an Azure Dedicated Host for the AKS nodes
resource "azurerm_dedicated_host" "dh" {
  name                    = "dh-aks-${var.prefix}-${var.resource_location}-${count.index + 1}"
  count                   = var.cluster_count
  location                = azurerm_resource_group.rg_aks.location
  dedicated_host_group_id = azurerm_dedicated_host_group.dhg.id
  platform_fault_domain   = 1
  sku_name                = var.dh_sku_name
  tags                    = azurerm_resource_group.rg_aks.tags
  auto_replace_on_failure = true
}

// Creating the User Assigned Identity for the Dedicated Host Group
resource "azurerm_user_assigned_identity" "aks_uai" {
  name                = "uai-aks-${var.prefix}-${var.resource_location}"
  location            = azurerm_resource_group.rg_identity.location
  resource_group_name = azurerm_resource_group.rg_identity.name
}

// Create Role Assignment for the User Assign Identity
// Assigning the User Assigned Identity to the Resource Group for the Dedicated Host Group
resource "azurerm_role_assignment" "aks_contributor" {
  scope                = azurerm_resource_group.rg_aks.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_uai.principal_id
}
