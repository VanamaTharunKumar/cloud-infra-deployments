output "key_vault_id" {
  value       = azurerm_key_vault.main.id
  description = "The ID of the Key Vault."
}

output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.keyvault.id
  description = "The ID of the Key Vault Private DNS Zone."
}