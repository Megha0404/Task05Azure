module "rg" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "ASP" {
  source         = "./modules/app_service_plan"
  for_each       = var.app_service_plans
  name           = each.value.name
  sku            = each.value.sku
  worker_count   = each.value.worker_count
  resource_group = var.resource_groups[each.value.rg_key].name
  location       = var.resource_groups[each.value.rg_key].location
  os_type        = each.value.os_type
  tags           = var.tags

  depends_on = [module.rg]
}

module "APP" {
  source   = "./modules/app_service"
  for_each = var.app_services

  name                = each.value.name
  location            = var.resource_groups[each.value.rg_key].location
  resource_group      = var.resource_groups[each.value.rg_key].name
  app_service_plan_id = module.ASP[each.value.asp_key].ASP_id
  allow-ip            = var.allow-ip
  allow_ip_rule       = var.allow_ip_rule
  allow_tag_rule      = var.allow_tag_rule
  tags                = var.tags

  depends_on = [module.ASP]
}

module "traffic_manager" {
  source = "./modules/traffic_manager"
  name   = var.traf_name

  resource_group = var.resource_groups[var.tr_rg].name

  routing_method = var.traf_routing_method

  endpoints = {
    app1 = {
      name        = var.app_services[var.tr_app1].name
      target      = module.APP[var.tr_app1].app_hostname
      resource_id = module.APP[var.tr_app1].app_id
      pr          = var.pr_app1
    },
    app2 = {
      name        = var.app_services[var.tr_app2].name
      target      = module.APP[var.tr_app2].app_hostname
      resource_id = module.APP[var.tr_app2].app_id
      pr          = var.pr_app2
    }
  }

  tags = var.tags

  depends_on = [module.APP]
}