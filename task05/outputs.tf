output "traffic_manager_fqdn" {
  value       = module.traffic_manager.fqdn
  description = "The FQDN of the Azure Traffic Manager Profile"
}

output "resource_groups" {
  value = module.resource_groups
}

output "app_service_plans" {
  value = module.app_service_plans
}

