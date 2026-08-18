output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the AKS cluster."
}

output "aks_principal_id" {
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  description = "The Principal ID of the system-assigned identity for the AKS cluster."
}