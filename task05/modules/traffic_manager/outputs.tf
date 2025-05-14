output "fqdn" {
  value       = azurerm_traffic_manager_profile.this.fqdn
  description = "The Fully Qualified Domain Name (FQDN) of the Azure Traffic Manager Profile"
}