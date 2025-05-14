# Variables for resource groups
variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource groups to create, including name and location"
}

# Variables for App Service Plans
variable "app_service_plans" {
  type = map(object({
    name     = string
    location = string
    sku = object({
      size = string
      tier = string
    })
    instances = number
  }))
  description = "Map of App Service Plans to create"
}

# Variables for App Services
variable "app_services" {
  type = map(object({
    name                = string
    location            = string
    app_service_plan_id = string
    resource_group_name = string
    ip_restrictions = list(object({
      name        = string
      ip_address  = optional(string)
      service_tag = optional(string)
      priority    = number
      action      = string
    }))
  }))
  description = "Map of App Services (Windows Web Apps) to configure"
}

# Variables for Traffic Manager Profile
variable "traffic_manager" {
  type = object({
    name           = string
    resource_group = string
    location       = string
    routing_method = string
    endpoints = map(object({
      name               = string
      target_resource_id = string
      location           = string
      priority           = optional(number)
    }))
  })
  description = "Traffic Manager configuration"
}

# Tags for all resources
variable "resource_tags" {
  type        = map(string)
  description = "Global tags for all resources"
}

variable "app_service_plan_to_rg_map" {
  type        = map(string)
  description = "Mapping of app service plans to their corresponding resource group keys"
}

# Example usage in terraform.tfvars:
# app_service_plan_to_rg_map = {
#   asp1 = "rg1"
#   asp2 = "rg2"
# }

variable "app_service_to_plan_map" {
  type        = map(string)
  description = "Mapping of app services to their corresponding app service plans"
}