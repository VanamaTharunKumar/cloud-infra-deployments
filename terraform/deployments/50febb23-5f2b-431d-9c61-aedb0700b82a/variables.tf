variable "domain_name" {
  type        = string
  description = "The domain name for the hosted zone"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB"
}

variable "alb_zone_id" {
  type        = string
  description = "Zone ID of the ALB"
}