variable "vpc_cidr" {
  description = "CIDR block for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "web-env"
  }
}