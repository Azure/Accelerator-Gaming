# Subscriptions
variable "hub_subscription_id" {
  type        = string
  description = "Hub Subscription id"
}

variable "spoke_subscription_id" {
  type        = string
  description = "Spoke Subscription id"
}

# Resource
variable "resource_location" {
  type        = string
  description = "The resource group location"
}

variable "resource_tags" {
  type        = map(string)
  description = "The resource tags"
}
variable "prefix" {
  type        = string
  description = "prefix for naming"
}

# Virtual Network

variable "hub_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "rg_hub" {
  type        = string
  description = "the hub resource group name"
}
variable "spoke_vnet_address_space" {
  type        = list(string)
  description = "The spoke vnet address space"
}
variable "subnet_address_prefix" {
  type        = list(string)
  description = "The subnet range"
}
