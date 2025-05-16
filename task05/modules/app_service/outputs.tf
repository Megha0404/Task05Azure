output "app_hostname" {
  value       = azurerm_windows_web_app.APP.default_hostname
  description = "App Service Id"
}

output "app_id" {
  description = "App Service ID"
  value       = azurerm_windows_web_app.APP.id
}
