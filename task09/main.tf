module "afw" {
  source              = "./modules/afw"
  prefix              = local.prefix
  location            = local.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  aks_subnet_name     = local.aks_subnet
  aks_loadbalancer_ip = var.aks_loadbalancer_ip
}
