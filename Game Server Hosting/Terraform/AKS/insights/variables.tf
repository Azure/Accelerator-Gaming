variable "resource_location" {
  type        = string
  description = "The resource group location"
}
variable "resource_tags" {
  type        = map(string)
  description = "The resource tags"
}
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