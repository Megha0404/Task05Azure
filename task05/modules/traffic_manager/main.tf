resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = var.tags
}

# Create explicit Traffic Manager endpoints for Windows Web Apps
resource "azurerm_traffic_manager_azure_endpoint" "app1_endpoint" {
  name               = "app1-endpoint"
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = var.endpoints["app1"].target_resource_id
}

resource "azurerm_traffic_manager_azure_endpoint" "app2_endpoint" {
  name               = "app2-endpoint"
  profile_id         = azurerm_traffic_manager_profile.this.id
  target_resource_id = var.endpoints["app2"].target_resource_id

}