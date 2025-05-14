# Create Resource Groups
module "resource_groups" {
  source = "./modules/resource_group"

  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.resource_tags
}

# Create App Service Plans
module "app_service_plans" {
  source = "./modules/app_service_plan"

  for_each = var.app_service_plans

  name                = each.value.name
  location            = each.value.location
  resource_group_name = module.resource_groups[var.app_service_plan_to_rg_map[each.key]].resource_group["name"]
  sku_name            = each.value.sku.size
  os_type             = "Windows"
  worker_count        = each.value.instances
  tags                = var.resource_tags
}
# Update App Services to reference App Service Plans
module "app_services" {
  source = "./modules/app_service"

  for_each = var.app_services

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  service_plan_id     = module.app_service_plans[var.app_service_to_plan_map[each.key]].app_service_plan["id"] # Use the mapping to resolve service plan ID
  ip_restrictions     = each.value.ip_restrictions
  tags                = var.resource_tags
}

# Update Traffic Manager to reference App Services
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                = var.traffic_manager.name
  resource_group_name = module.resource_groups["rg3"].resource_group["name"]
  location            = var.traffic_manager.location
  routing_method      = var.traffic_manager.routing_method

  endpoints = {
    endpoint1 = {
      name               = "app1-endpoint"
      target_resource_id = module.app_services["app1"].app_service["id"]
      location           = var.app_services["app1"].location
    }
    endpoint2 = {
      name               = "app2-endpoint"
      target_resource_id = module.app_services["app2"].app_service["id"]
      location           = var.app_services["app2"].location
    }
  }

  tags = var.resource_tags
}