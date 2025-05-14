variable "name" {
  type        = string
  description = "The name of the App Service Plan"
}

variable "location" {
  type        = string
  description = "The location for the App Service Plan"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "sku_name" {
  type        = string
  description = "The SKU of the App Service Plan (e.g., P1v3, P0v3, etc.)"
}

variable "os_type" {
  type        = string
  description = "The type of operating system for the App Service Plan (e.g., Windows or Linux)"
}

variable "worker_count" {
  type        = number
  description = "The number of workers (capacity) for the app service plan"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the app service plan"
}