variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID"
  type        = string
}