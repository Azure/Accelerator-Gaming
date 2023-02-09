resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.prefix}-${var.resource_location}-${count.index + 1}"
  count               = 3
  location            = azurerm_resource_group.rg_aks.location
  resource_group_name = azurerm_resource_group.rg_aks.name
  tags                = var.resource_tags
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.k8s_version
  sku_tier            = Paid
  default_node_pool {
    name                = "akspool" /*Max limit of 12 characters*/
    node_count          = var.node_count
    os_sku              = var.os_sku
    vm_size             = var.node_vm_size
    vnet_subnet_id      = var.aks_cluster_subnet_id
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 20
    zones               = ["1", "2", "3"]
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin    = "azure"
    network_mode      = "transparent"
    network_policy    = "azure"
    load_balancer_sku = "standard"
  }
  oms_agent {
    log_analytics_workspace_id = var.aks_law_id
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = "aksnp${count.index + 1}" /*Max limit of 12 characters*/
  count                 = 3
  tags                  = var.resource_tags
  os_sku                = var.os_sku
  node_count            = var.node_pool_count
  min_count             = 1
  max_count             = 20
  enable_auto_scaling   = true
  zones                 = ["1", "2", "3"]
  vnet_subnet_id        = var.aks_cluster_subnet_id
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster[count.index].id
  vm_size               = var.node_pool_vm_size
  priority              = "Regular"
}
  