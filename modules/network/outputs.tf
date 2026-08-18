output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network."
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
  description = "The ID of the AKS worker node subnet."
}

output "aks_pe_subnet_id" {
  value       = azurerm_subnet.aks_pe_subnet.id
  description = "The ID of the private endpoint subnet."
}