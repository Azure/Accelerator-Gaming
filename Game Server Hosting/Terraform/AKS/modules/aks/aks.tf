resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name = var.aks_cluster_name
  location = var.resource_location
  resource_group_name = var.rg_aks
  tags = var.resource_tags
  dns_prefix = var.aks_dns_prefix
  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name = var.node_pool_name
  tags = var.resource_tags
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size = var.vm_size_node_pool
  node_count = 1
  priority = "Regular"
  eviction_policy = "Delete"

}
  