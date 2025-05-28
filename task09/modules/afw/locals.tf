locals {
  afw_subnet_name   = "AzureFirewallSubnet"
  afw_pip_name      = "${var.prefix}-pip"
  afw_name          = "${var.prefix}-afw"
  route_table_name  = "${var.prefix}-rt"
  route_name        = "${var.prefix}-route-to-fw"
  network_rule_name = "${var.prefix}-network-rule"
  app_rule_name     = "${var.prefix}-app-rule"
  nat_rule_name     = "${var.prefix}-nat-rule"
}
