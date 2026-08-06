variable "azure_region" {
  description = "Azure region for resources"
  default     = "East US"
}

variable "my_ip" {
  description = "Your public IP for SSH access"
}

variable "ssh_public_key" {
  description = "Contents of public SSH key"
}

variable "project" {
  description = "Project name prefix"
  default     = "demo"
}

variable "environment" {
  description = "Deployment environment"
  default     = "dev"
}