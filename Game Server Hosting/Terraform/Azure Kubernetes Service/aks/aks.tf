resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.prefix}-${var.resource_location}-${count.index + 1}"
  count               = 3
  location            = azurerm_resource_group.rg_aks.location
  resource_group_name = azurerm_resource_group.rg_aks.name
  tags                = azurerm_resource_group.rg_aks.tags
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.k8s_version
  sku_tier            = "Paid"
  node_resource_group = azurerm_kubernetes_cluster.aks_cluster[count.index].name
  default_node_pool {
    name                     = "aksdnp${count.index + 1}" /*Max limit of 12 characters*/
    tags                     = azurerm_resource_group.rg_aks.tags
    os_sku                   = var.os_sku
    vm_size                  = var.node_pool_vm_size  
    vnet_subnet_id           = var.aks_cluster_subnet_id
    enable_auto_scaling      = true
    scale_down_mode          = "deallocate"
    min_count                = var.node_min_count
    max_count                = var.node_max_count
    node_count               = var.node_pool_count
    zones                    = ["1", "2", "3"]
    enable_node_public_ip    = true
    node_public_ip_prefix_id = var.node_pip_prefix_id
  }
  maintenance_window {
    allowed {
      day  = "Sunday"
      time = "23:00"
    }
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    load_balancer_sku = "Standard"
    network_plugin  = "Azure"
    network_policy = "Azure"
  }
  oms_agent {
    log_analytics_workspace_id = var.aks_law_id
  }

}
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                     = "aksnp${count.index + 1}" /*Max limit of 12 characters*/
  count                    = 3
  tags                     = azurerm_resource_group.rg_aks.tags
  os_sku                   = var.os_sku
  vnet_subnet_id           = var.aks_cluster_subnet_id
  enable_auto_scaling      = true
  scale_down_mode          = "deallocate"
  min_count                = var.node_min_count
  max_count                = var.node_max_count
  node_count               = var.node_pool_count
  zones                    = ["1", "2", "3"]
  kubernetes_cluster_id    = azurerm_kubernetes_cluster.aks_cluster[count.index].id
  vm_size                  = var.node_pool_vm_size
  priority                 = "Regular"
  enable_node_public_ip    = true
  node_public_ip_prefix_id = var.node_pip_prefix_id
}
  