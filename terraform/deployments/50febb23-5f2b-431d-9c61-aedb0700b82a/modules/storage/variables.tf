variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for RDS"
}

variable "rds_sg_id" {
  type        = string
  description = "Security group ID for RDS"
}

variable "db_password" {
  type        = string
  description = "Master database password"
  sensitive   = true
}

variable "environment" {
  type        = string
  default     = "production"
}