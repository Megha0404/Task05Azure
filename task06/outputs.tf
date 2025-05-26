output "sql_server_fqdn" {
  description = "The fully qualified domain name of the Azure SQL Server."
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "The default hostname of the Azure Linux Web App."
  value       = module.webapp.app_hostname
}
