variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "allowed_ssh_ip" {
  description = "The IP address allowed for SSH access"
  type        = string
  default     = "40.77.179.167/32"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default = {
    "Environment" = "Development"
    "Project"     = "Demo"
  }
}