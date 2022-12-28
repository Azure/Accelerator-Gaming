resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.resource_location
  resource_group_name = var.rg_aks
  tags                = var.resource_tags
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version  = var.k8s_version

  default_node_pool {
    name                = var.default_node_pool_name
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




}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = var.node_pool_name
  tags                  = var.resource_tags
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.node_pool_vm_size
  node_count            = var.node_pool_count
  priority              = "Regular"
}
  