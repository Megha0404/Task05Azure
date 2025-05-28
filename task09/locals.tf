locals {
  location       = "West US 2"
  prefix         = "cmtr-2olzzm40-mod9"
  resource_group = "${local.prefix}-rg"
  vnet_name      = "${local.prefix}-vnet"
  aks_subnet     = "aks-snet"

  dynamic_nat_rules = [
    {
      name                  = "aks-nat"
      protocols             = ["TCP"]
      source_addresses      = ["*"]
      destination_addresses = [azurerm_public_ip.afw_pip.ip_address]
      destination_ports     = ["80"]
      translated_address    = var.aks_loadbalancer_ip
      translated_port       = "80"
    }
  ]
}
