variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "my_public_ip" {
  description = "Allowed IP range for SSH access"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "Development"
}

variable "project" {
  description = "Project name for tagging"
  type        = string
  default     = "Demo"
}