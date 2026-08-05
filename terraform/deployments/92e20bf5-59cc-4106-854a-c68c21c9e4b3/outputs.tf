output "public_ip" {
  description = "Public IP of the web server"
  value       = azurerm_public_ip.web_pip.ip_address
}