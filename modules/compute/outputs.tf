output "aks_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the AKS cluster."
}