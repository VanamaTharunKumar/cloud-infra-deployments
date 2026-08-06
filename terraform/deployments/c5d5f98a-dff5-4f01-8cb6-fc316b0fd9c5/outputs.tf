output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = module.network.vnet_id
}