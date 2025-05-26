variable "name_prefix" {
  type        = string
  description = "The prefix used to generate resource names (e.g., 'cmaz-eh8dj90z-mod6')."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be deployed (e.g., 'westus2')."
}

variable "key_vault_rg_name" {
  type        = string
  description = "The name of the resource group containing the existing Azure Key Vault."
}

variable "key_vault_name" {
  type        = string
  description = "The name of the existing Azure Key Vault where SQL credentials will be stored."
}

variable "sql_db_sku" {
  type        = string
  description = "The SKU name for the Azure SQL Database (e.g., 'S2')."
}

variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the Azure SQL Server."
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

variable "asp_sku" {
  type        = string
  description = "The SKU name for the Azure App Service Plan (e.g., 'P0v3')."
}

variable "dotnet_version" {
  type        = string
  description = "The .NET version for the Linux Web App (e.g., '8.0')."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to all resources (e.g., { Creator = 'user@domain.com' })."
}
