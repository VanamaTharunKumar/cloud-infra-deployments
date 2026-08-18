variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group."
  default     = "aks-hub-spoke-rg"
}

variable "location" {
  type        = string
  description = "The Azure region for the deployment."
  default     = "eastus"
}