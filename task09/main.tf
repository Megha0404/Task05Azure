module "afw" {
  source              = "./modules/afw"
  prefix              = local.prefix
  location            = local.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  aks_subnet_name     = local.aks_subnet
  aks_loadbalancer_ip = var.aks_loadbalancer_ip

  # Pass in rule definitions
  application_rules = var.application_rules
  network_rules     = var.network_rules
  nat_rules         = local.dynamic_nat_rules
}

locals {
  dynamic_nat_rules = [
    {
      name                  = "nat-rule-1"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_ports     = ["80"]
      destination_addresses = [module.afw.afw_public_ip] # ✅ Now accessible
      translated_address    = var.aks_loadbalancer_ip
      translated_port       = "80"
    }
  ]
}
