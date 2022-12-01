# Resource Group
variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

#Subscriptions
variable "hub_subscription_id" {
  type        = string
  description = "Hub Subscription id"
}

variable "spoke_subscription_id" {
  type        = string
  description = "Spoke Subscription id"
}

# Resource
variable "resource_suffix" {
  type        = string
  description = "The resource suffix for the naming convention ie: resource-workload-environment-location-instance"
}

variable "resource_instance" {
  type        = string
  description = "The resource instance"
}

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

variable "subnet_range" {
  type        = list(string)
  description = "The subnet range"
}


