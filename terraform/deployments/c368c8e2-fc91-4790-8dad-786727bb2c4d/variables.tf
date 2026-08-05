variable "location" {
  description = "The Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "ssh_public_key" {
  description = "SSH public key string for the VM"
  type        = string
}