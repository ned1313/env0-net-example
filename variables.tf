variable "prefix" {
  type        = string
  description = "(Required) Naming prefix for resources."
}

variable "location" {
  type        = string
  description = "(Optional) Region for Azure resources, defaults to East US."
  default     = "eastus"
}

variable "environment" {
  type = string
  description = "(Required) Environment for Azure resources."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "(Optional) Address space for virtual network, defaults to 10.0.0.0/16."
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_space" {
  type        = list(string)
  description = "(Optional) Address space for subnet, defaults to 10.0.0.0/24"
  default = [ "10.0.0.0/24" ]
}

variable "common_tags" {
  type        = map(string)
  description = "(Optional) Tags to apply to all resources."
  default     = {}
}

variable "business_unit_tag" {
  type = string
  description = "(Optional) BU tag to apply to all resources."
  default = null
}

variable "organization_tag" {
  type = string
  description = "(Optional) Org tag to apply to all resources."
  default = null
}