variable "azure_region" {
  description = "Azure Region for deployment"
  default     = "East US"
}

variable "ssh_access_ip" {
  description = "Allowed SSH IP address"
  type        = string
}

variable "project_tags" {
  type    = map(string)
  default = { Environment = "Development", Project = "Demo" }
}