variable "my_public_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key for the VM"
  type        = string
}