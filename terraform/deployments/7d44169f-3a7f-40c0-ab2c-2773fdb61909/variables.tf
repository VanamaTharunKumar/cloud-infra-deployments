variable "region" {
  description = "The Azure region for the deployment"
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "demo-resources"
}