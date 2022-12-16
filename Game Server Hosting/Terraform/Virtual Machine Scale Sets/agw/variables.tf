# Resource Group Variables
variable "agw_rg_name" {
  type        = string
  description = "The resource group name"
}
variable "resource_location" {
    type        = string
    description = "The resource group location"
}
variable "resource_tags" {
    type        = map(string)
    description = "The resource tags"
}

# Virtual Network Variables
variable "vmss_vnet_name" {
    type        = string
    description = "The virtual network name"
}
variable "vnet_address_space" {
    type        = list(string)
    description = "The virtual network address space"
}
variable "agw_subnet_name" {
    type        = string
    description = "The subnet name"
}
variable "agw_subnet_address_prefix" {
    type        = list(string)
    description = "The subnet address prefix"
}

# Application Gateway Variables
variable "agw_name" {
    type        = string
    description = "The name of the Application Gateway"
}
variable "agw_sku_name" {
    type        = string
    description = "The Application Gateway SKU"
}
variable "agw_sku_tier" {
    type        = string
    description = "The Application Gateway SKU tier"
}
variable "agw_capacity" {
    type        = number
    description = "The Application Gateway capacity"
}
