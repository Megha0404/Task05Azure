resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id  # Corrected from app_service_plan_id to service_plan_id

  site_config {
    always_on = true

    # Define IP restrictions dynamically
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        ip_address  = try(ip_restriction.value.ip_address, null)
        service_tag = try(ip_restriction.value.service_tag, null)
        priority    = ip_restriction.value.priority
        action      = ip_restriction.value.action
      }
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}