output "storage_account_id" {
  value       = azurerm_storage_account.main.id
  description = "The ID of the created storage account."
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.main.primary_blob_endpoint
  description = "The primary blob endpoint for the storage account."
}