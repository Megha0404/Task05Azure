locals {
  afw_subnet_name     = "AzureFirewallSubnet"
  afw_pip_name        = "${var.prefix}-pip"
  afw_name            = "${var.prefix}-afw"
  route_table_name    = "${var.prefix}-rt"
}
