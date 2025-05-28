variable "aks_loadbalancer_ip" {
  description = "AKS Load Balancer Public IP"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Vnet name"
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
