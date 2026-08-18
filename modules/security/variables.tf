variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "key_vault_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "vnet_id" {
  type        = string
  description = "The ID of the VNet to link the private DNS zone."
}

variable "pe_subnet_id" {
  type        = string
  description = "The ID of the subnet for the private endpoint."
}