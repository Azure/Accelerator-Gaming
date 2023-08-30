// Create Resource Group for AKS Cluster
resource "azurerm_resource_group" "rg_aks" {
  name     = "rg-aks-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}

// Create a AKS Cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.prefix}-${var.resource_location}-${count.index + 1}"
  count               = var.cluster_count
  location            = azurerm_resource_group.rg_aks.location
  resource_group_name = azurerm_resource_group.rg_aks.name
  tags                = azurerm_resource_group.rg_aks.tags
  dns_prefix          = var.aks_dns_prefix
  sku_tier            = "Standard"
  node_resource_group = "rg-node-${var.prefix}-${var.resource_location}-${count.index + 1}"
  default_node_pool {
    name                     = "aksdnp${count.index + 1}" // Max limit of 12 characters
    tags                     = azurerm_resource_group.rg_aks.tags
    os_sku                   = var.os_sku
    vm_size                  = var.node_pool_vm_size
    vnet_subnet_id           = var.aks_cluster_subnet_id
    enable_auto_scaling      = false
    scale_down_mode          = "Deallocate"
    node_count               = var.node_count
    enable_node_public_ip    = true
    node_public_ip_prefix_id = var.default_node_pip_prefix_id
    host_group_id            = azurerm_dedicated_host_group.dhg.id
  }
  maintenance_window {
    allowed {
      day   = "Sunday"
      hours = [3]
    }
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_uai.id]
  }
  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
    network_policy    = "azure"
  }
  oms_agent {
    log_analytics_workspace_id = var.aks_law_id
  }
  workload_identity_enabled = true
  oidc_issuer_enabled       = true

  depends_on = [
    azurerm_dedicated_host.dh
  ]
}

//Create an AKS Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                     = "aksnp${count.index + 1}" /*Max limit of 12 characters*/
  count                    = var.node_pool_count
  tags                     = azurerm_resource_group.rg_aks.tags
  os_sku                   = var.os_sku
  vnet_subnet_id           = var.aks_cluster_subnet_id
  enable_auto_scaling      = false
  scale_down_mode          = "Deallocate"
  node_count               = var.node_count
  kubernetes_cluster_id    = azurerm_kubernetes_cluster.aks_cluster[count.index].id
  vm_size                  = var.node_pool_vm_size
  priority                 = "Regular"
  enable_node_public_ip    = true
  node_public_ip_prefix_id = var.node_pip_prefix_id
  host_group_id            = azurerm_dedicated_host_group.dhg.id
}