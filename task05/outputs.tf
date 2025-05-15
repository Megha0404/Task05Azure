output "traffic_manager_fqdn" {
  value       = module.traffic_manager.fqdn
  description = "The FQDN of the Azure Traffic Manager Profile"
}

output "resource_groups" {
  value       = module.resource_groups
  description = "value of the resource groups"
}

output "app_service_plans" {
  value       = module.app_service_plans
  description = "value of the app service plans"
}

