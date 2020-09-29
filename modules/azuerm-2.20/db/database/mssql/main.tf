terraform {
  backend "azurerm" {
    storage_account_name = "${var.resource_group_name}tfstate"
    container_name       = "tfstate"
    key                  = "infrastructure/sql/database/${var.database_name}/terraform.tfstate"
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_sql_database" "sql_db" {
  name                             = "${var.name_prefix}${var.database_name}"
  resource_group_name              = data.azurerm_resource_group.this.name
  location                         = data.azurerm_resource_group.this.location
  server_name                      = var.server_name
  create_mode                      = "Default"
  edition                          = var.edition
  collation                        = var.collation
  requested_service_objective_name = var.requested_service_objective_name
  tags                             = var.tags
}
