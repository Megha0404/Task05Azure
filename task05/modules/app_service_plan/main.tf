resource "azurerm_service_plan" "ASP" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku
  worker_count        = var.worker_count
  tags                = var.tags
}