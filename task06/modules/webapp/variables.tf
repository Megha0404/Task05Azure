variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the App Service Plan and Web App will be deployed."
}

variable "location" {
  type        = string
  description = "The Azure region where the App Service Plan and Web App will be deployed (e.g., 'westus2')."
}

variable "asp_name" {
  type        = string
  description = "The name of the Azure App Service Plan."
}

variable "asp_sku" {
  type        = string
  description = "The SKU name for the Azure App Service Plan (e.g., 'P0v3')."
}

variable "app_name" {
  type        = string
  description = "The name of the Azure Linux Web App."
}

variable "dotnet_version" {
  type        = string
  description = "The .NET version for the Linux Web App (e.g., '8.0')."
}

# Explicitly marked as sensitive to receive the secure SQL connection string
variable "sql_connection_string" {
  type        = string
  description = "The connection string for the Azure SQL Database to be used by the Web App."
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the App Service Plan and Web App resources."
}
