variable "region" {
  description = "Azure region for resources"
  default     = "eastus"
}

variable "my_public_ip" {
  description = "Allowed CIDR for SSH access"
}

variable "ssh_public_key" {
  description = "Public key content for SSH access"
}