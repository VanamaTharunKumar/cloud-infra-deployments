variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
  default     = "my-app-rg"
}

variable "region" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}