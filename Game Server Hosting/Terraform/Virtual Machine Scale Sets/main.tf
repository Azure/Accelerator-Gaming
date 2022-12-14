provider "azurerm" {
  features {}
}

module "network" {
  source = "./network"
  # Resource Group
  resource_group_name = var.resource_group_name
  resource_location   = var.resource_location
  resource_tags       = var.resource_tags
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

