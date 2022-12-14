# Reource Variables
variable "resource_location" {
  type        = string
  description = "The resource location, typically matches resource group location"
}

variable "resource_tags" {
  type        = map(string)
  description = "The base tags for all the resources"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

# Networking Variables
variable "hub_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "spoke_vnet_name" {
  type        = string
  description = "The hub vnet name"
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
  description = "The spoke subnet address prefix"
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

# Subscription variables
variable "hub_subscription_id" {
  type        = string
  description = "The hub subscription id"
}
variable "spoke_subscription_id" {
  type        = string
  description = "The spoke subscription id"
}

