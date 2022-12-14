# Resource Group
variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

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

# Virtual Network

variable "hub_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "spoke_vnet_name" {
  type        = string
  description = "The spoke vnet name"
}

variable "spoke_vnet_address_space" {
  type        = list(string)
  description = "The spoke vnet address space"
}
variable "spoke_subnet_name" {
  type        = string
  description = "The spoke subnet name"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "The subnet range"
}

variable "nsg_name" {
  type        = string
  description = "The nsg name"
}

variable "peer1_name" {
  type        = string
  description = "The peer1 name"
}

variable "peer2_name" {
  type        = string
  description = "The peer2 name"
}
