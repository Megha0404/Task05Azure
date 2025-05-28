resource "azurerm_public_ip" "afw_pip" {
  name                = local.afw_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  lifecycle {
    create_before_destroy = true
  }
}

resource "azurerm_subnet" "afw_subnet" {
  name                 = local.afw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/26"]
}

resource "azurerm_firewall" "afw" {
  name                = local.afw_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.afw_subnet.id
    public_ip_address_id = azurerm_public_ip.afw_pip.id
  }

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"
}

resource "azurerm_route_table" "afw_rt" {
  name                = local.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "aks_to_firewall" {
  name                   = "route-to-fw"
  resource_group_name    = var.resource_group_name
  route_table_name       = azurerm_route_table.afw_rt.name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
}

resource "azurerm_subnet_route_table_association" "aks_assoc" {
  subnet_id      = data.azurerm_subnet.aks.id
  route_table_id = azurerm_route_table.afw_rt.id
}

data "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

# Rules
resource "azurerm_firewall_network_rule_collection" "network_rule" {
  name                = "${var.prefix}-network-rule"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.resource_group_name
  priority            = 100
  action              = "Allow"

  dynamic "rule" {
    for_each = var.network_rules
    content {
      name                  = rule.value.name
      protocols             = rule.value.protocols
      source_addresses      = rule.value.source_addresses
      destination_addresses = rule.value.destination_addresses
      destination_ports     = rule.value.destination_ports
    }
  }

}


resource "azurerm_firewall_application_rule_collection" "app_rule" {
  name                = "${var.prefix}-app-rule"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.resource_group_name
  priority            = 101
  action              = "Allow"
  dynamic "rule" {
    for_each = var.application_rules
    content {
      name             = rule.value.name
      source_addresses = rule.value.source_addresses
      target_fqdns     = rule.value.target_fqdns

      dynamic "protocol" {
        for_each = rule.value.protocols
        content {
          port = protocol.value.port
          type = protocol.value.type
        }
      }
    }
  }

}

resource "azurerm_firewall_nat_rule_collection" "nat_rule" {
  name                = "${var.prefix}-nat-rule"
  azure_firewall_name = azurerm_firewall.afw.name
  resource_group_name = var.resource_group_name
  priority            = 102
  action              = "Dnat"
  dynamic "rule" {
    for_each = var.nat_rules
    content {
      name                  = rule.value.name
      protocols             = rule.value.protocols
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      translated_address    = rule.value.translated_address
      translated_port       = rule.value.translated_port
    }
  }

}
