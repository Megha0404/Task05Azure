variable "name" {
  type        = string
  description = "The name of the Traffic Manager Profile"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group for the Traffic Manager"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "routing_method" {
  type        = string
  description = "Routing method for Traffic Manager"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the Traffic Manager profile"
}

variable "endpoints" {
  type = map(object({
    name                = string
    target_resource_id  = string
    location            = string
    priority            = optional(number)
  }))
  description = "Traffic Manager endpoints"
}