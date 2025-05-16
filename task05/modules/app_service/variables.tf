variable "name" {
  description = "Name of the Web App"
  type        = string
}

variable "location" {
  description = "Location of the Web App"
  type        = string
}

variable "resource_group" {
  description = "Resource Group of the Web App"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "allow-ip" {
  description = "Allowed IP Address"
  type        = string
}

variable "allow_ip_rule" {
  description = "Allow rule name for IP"
  type        = string
}

variable "allow_tag_rule" {
  description = "Allow rule name for tag"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}