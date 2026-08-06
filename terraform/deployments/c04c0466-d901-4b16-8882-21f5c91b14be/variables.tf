variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "ssh_allowed_ip" {
  description = "IP address allowed for SSH access"
  type        = string
}

variable "key_name" {
  description = "AWS Key Pair name for EC2 instance"
  type        = string
}