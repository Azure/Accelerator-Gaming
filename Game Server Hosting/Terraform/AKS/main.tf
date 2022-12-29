provider "azurerm" {
  features {}
}

module "network" {
  source = "./network"
  # Resource Group
  rg_spoke          = var.rg_spoke
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  rg_hub            = var.rg_hub
  #Subscriptions
  hub_subscription_id   = var.hub_subscription_id
  spoke_subscription_id = var.spoke_subscription_id
  # Virtual Network
  hub_vnet_name            = var.hub_vnet_name
  spoke_vnet_name          = var.spoke_vnet_name
  spoke_vnet_address_space = var.spoke_vnet_address_space
  spoke_subnet_name        = var.spoke_subnet_name
  subnet_address_prefix    = var.subnet_address_prefix
  nsg_name                 = var.nsg_name
  peer1_name               = var.peer1_name
  peer2_name               = var.peer2_name
}
module "insights" {
  source = "./insights"
  # Resource Group
  rg_insights = var.rg_insights
  # Resource
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  # Log Analytics Workspace
  law_name          = var.law_name
  law_solution_name = var.law_solution_name
}
module "aks" {
  source = "./aks"
  # Resource Group
  rg_aks = var.rg_aks
  # Resource
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  # AKS Cluster
  aks_cluster_name       = var.aks_cluster_name
  aks_dns_prefix         = var.aks_dns_prefix
  k8s_version            = var.k8s_version
  default_node_pool_name = var.default_node_pool_name
  node_count             = var.node_count
  node_vm_size           = var.node_vm_size
  aks_cluster_subnet_id  = module.network.subnet_id
  os_sku                 = var.os_sku
  aks_law_id             = module.insights.id
  # AKS Cluster Node Pool
  node_pool_name    = var.node_pool_name
  node_pool_vm_size = var.node_pool_vm_size
  node_pool_count   = var.node_pool_count
}
