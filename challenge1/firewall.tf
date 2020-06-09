# define the firewall
# presentation = 443
# application = 62000
# data = 1433

resource "azurerm_resource_group" "fw" {
  for_each = toset(var.tiers)
  name     = each.value
  location = local.location
}

resource "azurerm_network_security_group" "nsg" {
  for_each = toset(var.tiers)
  name     = each.value
  location = local.location
  resource_group_name = local.resourcegroup
}

resource "azurerm_network_security_rule" "web" {
  name                        = "web"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "443"
  destination_port_range      = "6200"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.resourcegroup
  network_security_group_name = "web"
}

resource "azurerm_network_security_rule" "web" {
  name                        = "web"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "app"
  destination_port_range      = "web"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.resourcegroup
  network_security_group_name = "app"
}

resource "azurerm_network_security_rule" "app" {
  name                        = "front"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "web"
  destination_port_range      = "app"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.resourcegroup
  network_security_group_name = "app"
}


resource "azurerm_network_security_rule" "db" {
  name                        = "front"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "app"
  destination_port_range      = "db"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.resourcegroup
  network_security_group_name = "db"
}

resource "azurerm_network_security_rule" "db" {
  name                        = "front"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "db"
  destination_port_range      = "app"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.resourcegroup
  network_security_group_name = "db"
}