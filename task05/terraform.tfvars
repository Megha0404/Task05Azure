resource_groups = {
  rg1 = {
    name     = "cmaz-2olzzm40-mod5-rg-01"
    location = "West US"
  }
  rg2 = {
    name     = "cmaz-2olzzm40-mod5-rg-02"
    location = "East US"
  }
  rg3 = {
    name     = "cmaz-2olzzm40-mod5-rg-03"
    location = "Central US"
  }
}

tags = {
  Creator = "megha_kumari1@epam.com"
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-2olzzm40-mod5-asp-01"
    sku          = "P0v3"
    worker_count = 2
    os_type      = "Windows"
    rg_key       = "rg1"
  },
  asp2 = {
    name         = "cmaz-2olzzm40-mod5-asp-02"
    sku          = "P1v3"
    worker_count = 1
    os_type      = "Windows"
    rg_key       = "rg2"
  }
}

app_services = {
  app1 = {
    name    = "cmaz-2olzzm40-mod5-app-01"
    rg_key  = "rg1"
    asp_key = "asp1"
  },
  app2 = {
    name    = "cmaz-2olzzm40-mod5-app-02"
    rg_key  = "rg2"
    asp_key = "asp2"
  }
}

allow_ip_rule  = "allow-ip"
allow_tag_rule = "allow-tm"
allow-ip       = "18.153.146.156/32"

traf_name           = "cmaz-2olzzm40-mod5-traf"
traf_routing_method = "Performance"

tr_rg   = "rg3"
tr_app1 = "app1"
tr_app2 = "app2"

pr_app2 = 2
pr_app1 = 1