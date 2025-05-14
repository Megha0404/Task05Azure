resource "azurerm_service_plan" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name     = var.sku_name
  os_type      = var.os_type
  worker_count = var.worker_count

  tags = var.tags
}