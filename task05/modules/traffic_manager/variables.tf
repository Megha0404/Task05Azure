variable "name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for Traffic Manager"
}

variable "routing_method" {
  type        = string
  description = "Routing Method for Traffic Manager"
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
}

variable "endpoints" {
  type = map(object({
    name               = string
    target_resource_id = string

  }))
  description = "Map of endpoints to be added in Traffic Manager"
}