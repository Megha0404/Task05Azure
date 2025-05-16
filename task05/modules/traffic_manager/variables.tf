variable "name" {
  type        = string
  description = "TM profile name"
}

variable "resource_group" {
  type        = string
  description = "RG name"
}

variable "routing_method" {
  type        = string
  description = "Routing Method"
}

variable "endpoints" {
  description = "Map of endpoints"
  type = map(object({
    name        = string
    target      = string
    resource_id = string
    pr          = number
  }))
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}