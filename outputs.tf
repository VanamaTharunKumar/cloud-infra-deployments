output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "aks_cluster_id" {
  value = module.compute.aks_cluster_id
}

output "key_vault_uri" {
  value = module.security.key_vault_uri
}