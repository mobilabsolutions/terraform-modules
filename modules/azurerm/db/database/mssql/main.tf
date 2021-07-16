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

data "azurerm_mssql_server" "this" {
  name                = var.server_name
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_mssql_database" "mssql_db" {
  name                = "${var.name_prefix}${var.database_name}"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  server_id           = data.azurerm_mssql_server.this.id
  create_mode         = var.create_mode
  collation           = var.collation
  sku_name            = var.sku_name
  tags                = var.tags
}
