variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "ssh_key_name" {
  description = "The name of the EC2 key pair for SSH access"
  type        = string
}

variable "admin_ip" {
  description = "IP address allowed to SSH into the web server"
  type        = string
  default     = "18.60.204.167/32"
}