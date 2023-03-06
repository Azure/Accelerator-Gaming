// Resource
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
  description = "prefix for naming"
}

// Kubernetes Cluster Variables
variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}
variable "k8s_version" {
  type        = string
  description = "The kubernetes version"
}
variable "aks_law_id" {
  type        = string
  description = "The log analytics workspace id"
}

// Node Count for Default Pool and Node Pool
variable "cluster_count" {
  type        = number
  description = "The number of clusters to be created"
}
variable "os_sku" {
  type        = string
  description = "The OS SKU"
}
variable "aks_cluster_subnet_id" {
  type        = string
  description = "The subnet id"
}
variable "default_node_pip_prefix_id" {
  type        = string
  description = "The public ip prefix id for default node pool"
}
variable "node_pip_prefix_id" {
  type        = string
  description = "The public ip prefix id for node pool"
}
variable "node_pool_count" {
  type        = number
  description = "The number of nodes pools to be created in the cluster"
}
variable "node_pool_vm_size" {
  type        = string
  description = "The VM size for the node pool"
}
variable "node_count" {
  type        = number
  description = "The number of nodes to be created in the pool"
}
