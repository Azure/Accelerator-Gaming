provider "azurerm" {
  features {}
}

module "network" {
  source = "./network"
  # Resource
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  prefix            = var.prefix
  # Resource Group
  rg_hub = var.rg_hub
  #Subscriptions
  hub_subscription_id   = var.hub_subscription_id
  spoke_subscription_id = var.spoke_subscription_id
  # Virtual Network
  hub_vnet_name            = var.hub_vnet_name
  spoke_vnet_address_space = var.spoke_vnet_address_space
  subnet_address_prefix    = var.subnet_address_prefix

}
module "insights" {
  source = "./insights"
  # Resource
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  prefix            = var.prefix
}
module "aks" {
  source = "./aks"
  # Resource
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  prefix            = var.prefix
  # AKS Cluster
  aks_dns_prefix        = var.aks_dns_prefix
  aks_cluster_subnet_id = module.network.subnet_id
  os_sku                = var.os_sku
  aks_law_id            = module.insights.id
  cluster_count         = var.cluster_count
  dh_sku_name           = var.dh_sku_name
  # AKS Cluster Node Pool
  node_pool_vm_size          = var.node_pool_vm_size
  node_pool_count            = var.node_pool_count
  node_count                 = var.node_count
  node_pip_prefix_id         = module.network.node_pip_prefix_id
  default_node_pip_prefix_id = module.network.default_node_pip_prefix_id
}
