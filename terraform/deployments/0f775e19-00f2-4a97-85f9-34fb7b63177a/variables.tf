variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for the EC2 instance"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "The CIDR block allowed to SSH into the web server"
  type        = string
  default     = "40.77.179.167/32"
}