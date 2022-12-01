locals {
  name_suffix = "${var.workload_name}-${var.environment}-${var.resource_location}"
}

module "network" {
  source = "./network"
  # Resource Group
  resource_group_name = "rg=${var.workload_name}-${var.environment}-${var.resource_location}"
  #Subscriptions
  hub_subscription_id   = var.hub_subscription_id
  spoke_subscription_id = var.spoke_subscription_id
  # Resource
  resource_suffix = local.name_suffix
  resource_instance = var.resource_instance
  resource_location = var.resource_location
  resource_tags = var.resource_tags
  # Virtual Network
  hub_vnet_name = var.hub_vnet_name
  spoke_vnet_name = var.spoke_vnet_name
  subnet_range = var.subnet_range
}

