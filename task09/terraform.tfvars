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

nat_rules = []
