terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.33.0"
    }
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.name_prefix}${var.server_name}"
  resource_group_name          = data.azurerm_resource_group.this.name
  location                     = data.azurerm_resource_group.this.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  tags                         = var.tags
}

resource "azurerm_sql_firewall_rule" "fwr" {
  count               = length(var.rule_list)
  resource_group_name = data.azurerm_resource_group.this.name
  server_name         = azurerm_sql_server.sql_server.name
  name                = lookup(var.rule_list[count.index], "name")
  start_ip_address    = lookup(var.rule_list[count.index], "start_ip_address")
  end_ip_address      = lookup(var.rule_list[count.index], "end_ip_address")
}

resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  count               = var.sql_virtual_network_rule_name != "" ? 1 : 0
  name                = var.sql_virtual_network_rule_name
  resource_group_name = data.azurerm_resource_group.this.name
  server_name         = azurerm_sql_server.sql_server.name
  subnet_id           = var.subnet_id
}