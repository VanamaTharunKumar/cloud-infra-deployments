variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "address_space" {
  type        = string
  description = "The address space of the VNet."
}

variable "aks_subnet_prefix" {
  type        = string
  description = "The CIDR block for the AKS subnet."
}

variable "pe_subnet_prefix" {
  type        = string
  description = "The CIDR block for the Private Endpoint subnet."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources."
  default     = {}
}