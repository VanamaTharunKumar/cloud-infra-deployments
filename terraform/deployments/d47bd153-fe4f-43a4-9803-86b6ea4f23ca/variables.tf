variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "project" {
  description = "Project name"
  default     = "Demo"
}

variable "environment" {
  description = "Environment type"
  default     = "Dev"
}

variable "vnet_cidr" {
  description = "VNet CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  default     = "10.0.1.0/24"
}