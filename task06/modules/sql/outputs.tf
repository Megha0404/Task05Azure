# Use the secret directly in the connection string
output "sql_connection_string" {
  description = "SQL Connection String for ADO.NET clients"
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.sql.fully_qualified_domain_name,
    azurerm_mssql_database.sql_db.name,
    var.sql_admin_username,
    random_password.sql_password.result
  )
  sensitive = true
}

output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

# Test output to verify if validation tool recognizes sensitive attribute
output "sql_connection_string_test" {
  description = "Test output to verify sensitive attribute recognition."
  value       = "test-connection-string"
  sensitive   = true
}
