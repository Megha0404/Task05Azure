resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "existing_kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

module "sql" {
  source               = "./modules/sql"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = var.location
  sql_server_name      = local.sql_server_name
  sql_db_name          = local.sql_db_name
  sql_db_sku           = var.sql_db_sku
  sql_admin_username   = var.sql_admin_username
  key_vault_id         = data.azurerm_key_vault.existing_kv.id
  secret_name_admin    = var.secret_name_admin
  secret_name_password = var.secret_name_password
  allowed_ip_address   = var.allowed_ip_address
  firewall_rule_name   = var.firewall_rule_name
  tags                 = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  asp_name              = local.asp_name
  asp_sku               = var.asp_sku
  app_name              = local.app_name
  dotnet_version        = var.dotnet_version
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}
