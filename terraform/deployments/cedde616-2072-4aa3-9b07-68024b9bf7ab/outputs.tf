output "vm_ids" {
  value = { for k, vm in azurerm_linux_virtual_machine.vms : k => vm.id }
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.logs.id
}