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
variable "aks_cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}
variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}

variable "vm_size_node_pool" {
  type        = string
  description = "The VM size for the node pool"
}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool"
}


