variable "region" {
  type    = string
  default = "East US"
}

variable "ssh_allowed_ip" {
  type        = string
  description = "Allowed CIDR for SSH access"
}

variable "environment" {
  type    = string
  default = "Development"
}

variable "project" {
  type    = string
  default = "Demo"
}