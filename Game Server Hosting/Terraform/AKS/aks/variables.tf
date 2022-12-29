variable "resource_location" {
  type        = string
  description = "The resource group location"
}

variable "resource_tags" {
  type        = map(string)
  description = "The resource tags"
}
# Resource Group
variable "rg_aks" {
  type        = string
  description = "The resource group name"
}
# Kubernetes Cluster Variables
variable "aks_cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}
variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}
variable "k8s_version" {
  type        = string
  description = "The kubernetes version"
}
variable "default_node_pool_name" {
  type        = string
  description = "The name of the default node pool"
}
variable "node_count" {
  type        = number
  description = "The number of nodes in the node pool"
}
variable "os_sku" {
  type        = string
  description = "The OS SKU"
}
variable "node_vm_size" {
  type        = string
  description = "The VM size for the node pool"
}
variable "aks_cluster_subnet_id" {
  type        = string
  description = "The subnet id"
}
variable "aks_law_id" {
  type        = string
  description = "The log analytics workspace id"
}
# Kubernetes Cluster Node Pool Variables
variable "node_pool_name" {
  type        = string
  description = "The name of the node pool"
}
variable "node_pool_count" {
  type        = number
  description = "The number of nodes in the node pool"
}
variable "node_pool_vm_size" {
  type        = string
  description = "The VM size for the node pool"
}