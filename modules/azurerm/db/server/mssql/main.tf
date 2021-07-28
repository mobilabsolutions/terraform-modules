terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = "${var.name_prefix}${var.server_name}"
  resource_group_name          = data.azurerm_resource_group.this.name
  location                     = data.azurerm_resource_group.this.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  tags                         = var.tags
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  count            = length(var.rule_list)
  server_id        = azurerm_mssql_server.mssql_server.id
  name             = lookup(var.rule_list[count.index], "name")
  start_ip_address = lookup(var.rule_list[count.index], "start_ip_address")
  end_ip_address   = lookup(var.rule_list[count.index], "end_ip_address")
}

resource "azurerm_mssql_virtual_network_rule" "mssql_vnet_rule" {
  count     = var.sql_virtual_network_rule_name != "" ? 1 : 0
  name      = var.sql_virtual_network_rule_name
  server_id = azurerm_mssql_server.mssql_server.id
  subnet_id = var.subnet_id
}