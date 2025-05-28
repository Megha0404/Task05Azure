variable "prefix" {
  description = "Prefix used for all resources"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the existing virtual network"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_loadbalancer_ip" {
  description = "Public IP of the AKS load balancer"
  type        = string
}

variable "network_rules" {
  type = list(object({
    name                  = string
    protocols             = list(string)
    source_addresses      = list(string)
    destination_addresses = list(string)
    destination_ports     = list(string)
  }))
}

variable "application_rules" {
  type = list(object({
    name             = string
    source_addresses = list(string)
    target_fqdns     = list(string)
    protocols = list(object({
      port = number
      type = string
    }))
  }))
}

variable "nat_rules" {
  type = list(object({
    name                  = string
    protocols             = list(string)
    source_addresses      = list(string)
    destination_ports     = list(string)
    destination_addresses = list(string)
    translated_address    = string
    translated_port       = string
  }))
}
