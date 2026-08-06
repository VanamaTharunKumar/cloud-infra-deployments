variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ssh_key_name" {
  description = "The name of the EC2 key pair for SSH access"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "CIDR block restricted for SSH access"
  type        = string
  default     = "40.77.179.167/32"
}