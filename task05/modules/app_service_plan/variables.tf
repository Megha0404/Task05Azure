variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Location of the App Service Plan"
  type        = string
}

variable "resource_group" {
  description = "Resource Group it belongs to"
  type        = string
}

variable "sku" {
  description = "SKU Name"
  type        = string
}

variable "worker_count" {
  description = "Instance count"
  type        = string
}

variable "os_type" {
  description = "OS Type"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}