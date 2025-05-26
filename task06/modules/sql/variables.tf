variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the SQL Server and Database will be deployed."
}

variable "location" {
  type        = string
  description = "The Azure region where the SQL Server and Database will be deployed (e.g., 'westus2')."
}

variable "sql_server_name" {
  type        = string
  description = "The name of the Azure SQL Server."
}

variable "sql_db_name" {
  type        = string
  description = "The name of the Azure SQL Database."
}

variable "sql_db_sku" {
  type        = string
  description = "The SKU name for the Azure SQL Database (e.g., 'S2')."
}

variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the Azure SQL Server."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the existing Azure Key Vault where SQL admin credentials will be stored."
}

variable "secret_name_admin" {
  type        = string
  description = "The name of the Key Vault secret for the SQL admin username."
}

variable "secret_name_password" {
  type        = string
  description = "The name of the Key Vault secret for the SQL admin password."
}

variable "allowed_ip_address" {
  type        = string
  description = "The IP address allowed to access the SQL Server (e.g., verification agent IP)."
}

variable "firewall_rule_name" {
  type        = string
  description = "The name of the firewall rule for the allowed IP address."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the SQL Server and Database resources."
}
