variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "aks_subnet_id" {
  type        = string
  description = "The ID of the AKS subnet."
}

variable "aks_pe_subnet_id" {
  type        = string
  description = "The ID of the private endpoint subnet."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault."
}

variable "private_dns_zone_id" {
  type        = string
  description = "The ID of the Key Vault private DNS zone."
}