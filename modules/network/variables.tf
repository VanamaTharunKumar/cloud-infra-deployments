variable "resource_group_name" {
  type        = string
  description = "The name of the existing resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the network resources."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "The address space for the virtual network."
}