# Resource Groups
resource_groups = {
  rg1 = {
    name     = "cmaz-2olzzm40-mod5-rg-01"
    location = "eastus"
  }
  rg2 = {
    name     = "cmaz-2olzzm40-mod5-rg-02"
    location = "westus"
  }
  rg3 = {
    name     = "cmaz-2olzzm40-mod5-rg-03"
    location = "centralus"
  }
}
app_service_plan_to_rg_map = {
  asp1 = "rg1"
  asp2 = "rg2"
}
# App Service Plans
app_service_plans = {
  asp1 = {
    name      = "cmaz-2olzzm40-mod5-asp-01"
    location  = "eastus"
    sku       = { size = "P0v3", tier = "PremiumV3" } # Use object for sku
    instances = 2
  }
  asp2 = {
    name      = "cmaz-2olzzm40-mod5-asp-02"
    location  = "westus"
    sku       = { size = "P1v3", tier = "PremiumV3" } # Use object for sku
    instances = 1
  }
}
# App Services (Windows Web Apps)
app_services = {
  app1 = {
    name                = "cmaz-2olzzm40-mod5-app-01"
    location            = "eastus"
    resource_group_name = "cmaz-2olzzm40-mod5-rg-01"
    app_service_plan_id = "asp1"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32"
        priority   = 100
        action     = "Allow"
      },
      {
        name        = "allow-tm"
        service_tag = "AzureTrafficManager"
        priority    = 200
        action      = "Allow"
      },
      {
        name       = "deny-all"
        ip_address = "0.0.0.0/0"
        priority   = 2147483647
        action     = "Deny"
      }
    ]
  }
  app2 = {
    name                = "cmaz-2olzzm40-mod5-app-02"
    location            = "westus"
    resource_group_name = "cmaz-2olzzm40-mod5-rg-02"
    app_service_plan_id = "asp2"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32"
        priority   = 100
        action     = "Allow"
      },
      {
        name        = "allow-tm"
        service_tag = "AzureTrafficManager"
        priority    = 200
        action      = "Allow"
      },
      {
        name       = "deny-all"
        ip_address = "0.0.0.0/0"
        priority   = 2147483647
        action     = "Deny"
      }
    ]
  }
}
app_service_to_plan_map = {
  app1 = "asp1"
  app2 = "asp2"
}
# Traffic Manager
traffic_manager = {
  name           = "cmaz-2olzzm40-mod5-traf"
  resource_group = "cmaz-2olzzm40-mod5-rg-03"
  location       = "centralus"
  routing_method = "Performance"
  endpoints = {
    endpoint1 = {
      name               = "app1-endpoint"
      target_resource_id = ""
      location           = "eastus"
    }
    endpoint2 = {
      name               = "app2-endpoint"
      target_resource_id = ""
      location           = "westus"
    }
  }
}

# Tags
resource_tags = {
  Creator = "megha_kumari1@epam.com"
}