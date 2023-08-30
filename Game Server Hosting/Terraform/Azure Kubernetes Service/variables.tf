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
# Subscription variables
variable "hub_subscription_id" {
  type        = string
  description = "The hub subscription id"
}
variable "spoke_subscription_id" {
  type        = string
  description = "The spoke subscription id"
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

# Kubernetes Module Variables
# Cluster Variables

variable "cluster_count" {
  type        = number
  description = "The AKS cluster count"
}
variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}
variable "os_sku" {
  type        = string
  description = "The AKS OS SKU"
}
# Kubernetes Cluster Node Pool Variables
variable "node_pool_count" {
  type        = number
  description = "Number of Node Pools to be created in the cluster"
}
variable "node_pool_vm_size" {
  type        = string
  description = "The AKS node pool VM size"
}
variable "node_count" {
  type        = number
  description = "Number of nodes to be created in the pool"
}
variable "dh_sku_name" {
  type        = string
  description = "The AKS disk size"
}