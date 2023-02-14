provider "azurerm" {
  features {}
}

module "network" {
  source = "./network"
  # Resource Group
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  rg_hub            = var.rg_hub
  prefix            = var.prefix
  #Subscriptions
  hub_subscription_id   = var.hub_subscription_id
  spoke_subscription_id = var.spoke_subscription_id
  # Virtual Network
  hub_vnet_name            = var.hub_vnet_name
  spoke_vnet_address_space = var.spoke_vnet_address_space
  subnet_address_prefix    = var.subnet_address_prefix
}

module "vmss" {
  source = "./vmss"
  # Resource Group
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  prefix            = var.prefix
  # Virtual Machine Scale Set
  vmss_sku       = var.vmss_sku
  vmss_count     = var.vmss_count
  admin_username = var.admin_username
  admin_password = var.admin_password
  subnet_id      = module.network.subnet_id
  pip_prefix_id  = module.network.pip_prefix_id
}