variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "resource_location" {
  type        = string
  description = "The resource group location"
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

variable "resource_tags" {
  type        = map(string)
  description = "The resource tags"
}