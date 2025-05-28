locals {
  location       = "West US 2"
  prefix         = "cmtr-2olzzm40-mod9"
  resource_group = "${local.prefix}-rg"
  vnet_name      = "${local.prefix}-vnet"
  aks_subnet     = "aks-snet"


}
