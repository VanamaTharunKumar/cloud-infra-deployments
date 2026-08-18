variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resources."
}

variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster."
}

variable "dns_prefix" {
  type        = string
  description = "The DNS prefix for the cluster."
}

variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to use."
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the default node pool."
  default     = 3
}

variable "vm_size" {
  type        = string
  description = "The VM size for the nodes."
  default     = "Standard_DS2_v2"
}

variable "aks_subnet_id" {
  type        = string
  description = "The ID of the AKS subnet."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The ID of the Log Analytics workspace."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resources."
  default     = {}
}