output "firewall_public_ip" {
  value = azurerm_public_ip.afw_pip.ip_address
}

output "firewall_private_ip" {
  value = azurerm_firewall.afw.ip_configuration[0].private_ip_address
}

output "afw_public_ip" {
  description = "Public IP address of the Azure Firewall"
  value       = azurerm_public_ip.afw_pip.ip_address
}

