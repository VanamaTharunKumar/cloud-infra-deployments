output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network."
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
  description = "The ID of the AKS subnet."
}

output "pe_subnet_id" {
  value       = azurerm_subnet.pe_subnet.id
  description = "The ID of the Private Endpoint subnet."
}

output "aks_nsg_id" {
  value       = azurerm_network_security_group.aks_nsg.id
  description = "The ID of the AKS NSG."
}