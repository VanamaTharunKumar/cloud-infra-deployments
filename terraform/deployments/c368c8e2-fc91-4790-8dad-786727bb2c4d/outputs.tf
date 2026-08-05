output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "vm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.web.id
}