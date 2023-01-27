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