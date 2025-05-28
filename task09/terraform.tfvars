aks_loadbalancer_ip = "4.246.6.193"
resource_group_name = "cmtr-2olzzm40-mod9-rg"
vnet_name           = "cmtr-2olzzm40-mod9-vnet"


network_rules = [
  {
    name                  = "AllowDNS"
    protocols             = ["UDP"]
    source_addresses      = ["10.0.0.0/24"]
    destination_addresses = ["*"]
    destination_ports     = ["53"]
  }
]

application_rules = [
  {
    name             = "AllowHttp"
    source_addresses = ["10.0.0.0/24"]
    target_fqdns     = ["www.bing.com"]
    protocols = [
      {
        port = 80
        type = "Http"
      }
    ]
  }
]

nat_rules = [
  {
    name                  = "HTTPInbound"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    destination_ports     = ["80"]
    destination_addresses = ["${azurerm_public_ip.afw_pip.ip_address}"]
    translated_address    = var.aks_loadbalancer_ip
    translated_port       = "80"
  }
]
