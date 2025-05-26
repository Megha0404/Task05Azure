output "app_hostname" {
  description = "The default hostname of the Azure Linux Web App."
  value       = azurerm_linux_web_app.app.default_hostname
}
