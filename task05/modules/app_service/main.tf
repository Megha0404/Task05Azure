resource "azurerm_windows_web_app" "APP" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id     = var.app_service_plan_id
  tags                = var.tags

  site_config {
    always_on                     = true
    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = [
        {
          name       = var.allow_ip_rule
          ip_address = var.allow-ip
          priority   = 100
          action     = "Allow"
        },
        {
          name        = var.allow_tag_rule
          service_tag = "AzureTrafficManager"
          priority    = 200
          action      = "Allow"
        }
      ]

      content {
        name        = ip_restriction.value.name
        priority    = ip_restriction.value.priority
        action      = ip_restriction.value.action
        ip_address  = lookup(ip_restriction.value, "ip_address", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
      }
    }
  }

  ##ip_restriction_default_action = "Deny"

}