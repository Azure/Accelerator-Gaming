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
# Virtual Machine Scale Set
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
variable "subnet_id" {
  type        = string
  description = "The subnet id"
}
variable "pip_prefix_id" {

}