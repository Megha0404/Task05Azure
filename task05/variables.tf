variable "resource_groups" {
  description = "Map of resource groups with names and locations"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "Tags to apply on resources"
  type        = map(string)
}

variable "app_service_plans" {
  description = "Map of App Service Plans"
  type = map(object({
    name         = string
    sku          = string
    worker_count = string
    os_type      = string
    rg_key       = string
  }))
}

variable "app_services" {
  description = "Map of App Services"
  type = map(object({
    name    = string
    rg_key  = string
    asp_key = string
  }))
}

variable "allow-ip" {
  description = "Verification agent IP Address"
  type        = string
}

variable "allow_ip_rule" {
  description = "Name of IP Allow rule"
  type        = string
}

variable "allow_tag_rule" {
  description = "Name of service tag Allow rule"
  type        = string
}

variable "traf_name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "traf_routing_method" {
  description = "Routing method for the Traffic Manager"
  type        = string
}

variable "tr_rg" {
  description = "Resource Group for Traffic Manager"
  type        = string
}

variable "tr_app1" {
  description = "App 1 for Traffic Manager Endpoint"
  type        = string
}

variable "tr_app2" {
  description = "App 2 for Traffic Manager Endpoint"
  type        = string
}

variable "pr_app1" {
  description = "Priority of App 1"
  type        = string
}

variable "pr_app2" {
  description = "Priority of App 2"
  type        = string
}