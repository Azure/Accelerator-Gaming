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

# Virtual Machine Scale Set
variable "vmss_name" {
  type        = string
  description = "The name of the VMSS"
}

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

# Virtual Network

variable "spoke_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "subnet_id" {
  type        = string
  description = "The subnet id"
}

variable "network_interface_name" {
  type        = string
  description = "The network interface id"
}

variable "ip_configuration_name" {
  type        = string
  description = "The ip configuration id"
}

# Resource Group

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

