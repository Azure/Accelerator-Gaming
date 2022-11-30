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

variable "spoke_vnet_name" {
  type        = string
  description = "The hub vnet name"
}

variable "subnet_id" {
  type        = list(string)
  description = "The subnet id"
}

variable "network_interface_name" {
  type        = list(string)
  description = "The network interface id"
}

variable "ip_configuration_name" {
  type        = list(string)
  description = "The ip configuration id"
}

# Resource Group

variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}
  
