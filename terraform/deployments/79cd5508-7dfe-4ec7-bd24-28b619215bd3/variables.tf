variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "admin_cidr" {
  type        = string
  description = "CIDR block allowed for SSH access"
}

variable "key_name" {
  type        = string
  description = "The SSH key pair name for instance access"
}