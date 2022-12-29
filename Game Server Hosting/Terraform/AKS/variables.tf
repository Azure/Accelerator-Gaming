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
#Insights Module Variables
variable "rg_insights" {
  type        = string
  description = "The resource group name"
}
variable "law_name" {
  type        = string
  description = "The log analytics workspace name"
}
variable "law_solution_name" {
  type        = string
  description = "The log analytics workspace solution name"
}
# Kubernetes Module Variables
# Cluster Variables
variable "rg_aks" {
  type        = string
  description = "The AKS resource group name"
}
variable "aks_cluster_name" {
  type        = string
  description = "The AKS cluster name"
}
variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}
variable "k8s_version" {
  type        = string
  description = "The AKS Kubernetes version"
}
variable "default_node_pool_name" {
  type        = string
  description = "The AKS default node pool name"
}
variable "node_count" {
  type        = number
  description = "The AKS node count"
}
variable "node_vm_size" {
  type        = string
  description = "The AKS node VM size"
}
variable "os_sku" {
  type        = string
  description = "The AKS OS SKU"
}
# Kubernetes Cluster Node Pool Variables
variable "node_pool_name" {
  type        = string
  description = "The AKS default node pool name"
}
variable "node_pool_count" {
  type        = number
  description = "The AKS node pool count"
}
variable "node_pool_vm_size" {
  type        = string
  description = "The AKS node pool VM size"
}
