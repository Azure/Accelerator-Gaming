# Reource Variables
variable "resource_location" {
  type        = string
  description = "The resource location, typically matches resource group location"
}

variable "resource_tags" {
  type        = map(string)
  description = "The base tags for all the resources"
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
variable "rg_spoke" {
  type        = string
  description = "The resource group name"
}

variable "rg_hub" {
  type        = string
  description = "the hub resource group name"
}
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
# Kubernetes Module Variables
variable "rg_aks" {
  type        = string
  description = "The AKS resource group name"
}
variable "aks_cluster_name" {
  type        = string
  description = "The AKS cluster name"
}
variable "dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}
variable "kubernetes_version" {
  type        = string
  description = "The AKS Kubernetes version"
}
variable "node_count" {
  type        = number
  description = "The AKS node count"
}
variable "node_vm_size" {
  type        = string
  description = "The AKS node VM size"
}
variable "default_node_pool_name" {
    type        = string
    description = "The AKS default node pool name"
}
variable "node_pool_name" {
    type        = string
    description = "The AKS node pool name"
}
variable "node_pool_vm_size" {
    type        = string
    description = "The AKS node pool VM size"
}
