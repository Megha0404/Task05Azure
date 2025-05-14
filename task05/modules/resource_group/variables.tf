variable "name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The location for the resource group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the resource group"
}