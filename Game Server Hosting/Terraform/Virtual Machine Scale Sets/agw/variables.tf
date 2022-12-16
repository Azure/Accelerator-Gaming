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
variable "agw_pip" {
  type        = string
  description = "The public IP address name"
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
variable "gw_ipconfig_name" {
  type        = string
  description = "The Application Gateway IP configuration name"
}
variable "frontend_port_name" {
    type        = string
    description = "The Application Gateway frontend port name"  
}
variable "frontend_ipconfig_name" {
    type        = string
    description = "The Application Gateway frontend IP configuration name"  
}
variable "backend_address_pool_name" {
    type        = string
    description = "The Application Gateway backend address pool name"  
}
variable "backend_http_settings_name" {
    type        = string
    description = "The Application Gateway backend HTTP settings name"  
}
variable "http_listener_name" {
    type        = string
    description = "The Application Gateway HTTP listener name"  
}
variable "request_routing_rule_name" {
    type        = string
    description = "The Application Gateway request routing rule name"  
}