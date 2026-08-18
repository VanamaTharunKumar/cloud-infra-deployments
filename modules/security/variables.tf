variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "vnet_id" {
  type        = string
  description = "The ID of the VNet to link with Private DNS."
}

variable "tenant_id" {
  type        = string
  description = "The Azure Tenant ID."
}