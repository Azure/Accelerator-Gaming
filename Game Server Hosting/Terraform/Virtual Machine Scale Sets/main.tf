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

module "vmss" {
  source = "./vmss"
  # Resource Group
  rg_vmss           = var.rg_vmss
  resource_location = var.resource_location
  resource_tags     = var.resource_tags
  # Virtual Machine Scale Set
  vmss_name      = var.vmss_name
  vmss_sku       = var.vmss_sku
  vmss_count     = var.vmss_count
  admin_username = var.admin_username
  admin_password = var.admin_password
  nic_name       = var.nic_name
  ipconfig_name  = var.ipconfig_name
  subnet_id      = module.network.subnet_id
}