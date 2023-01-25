# Reource Variables
variable "resource_location" {
  type        = string
  description = "The resource location, typically matches resource group location"
}

variable "resource_tags" {
  type        = map(string)
  description = "The base tags for all the resources"
}
variable "prefix" {
  type        = string
  description = "The prefix for naming"
}

# Networking Module Variables
variable "rg_hub" {
  type        = string
  description = "the hub resource group name"
}
variable "hub_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "spoke_vnet_address_space" {
  type        = list(string)
  description = "The spoke vnet address space"
}
variable "subnet_address_prefix" {
  type        = list(string)
  description = "The spoke subnet address prefix"
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

# Virtual Machine Scale Set Module Variables
variable "admin_username" {
  type        = string
  description = "The admin username for the VMSS"
}

variable "admin_password" {
  type        = string
  description = "The admin password for the VMSS"
}

variable "vmss_sku" {
  type        = string
  description = "The VMSS SKU"
}
variable "vmss_count" {
  type        = number
  description = "The number of VMSS instances"
}
