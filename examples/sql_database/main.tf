provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

module "resource_group" {
  source   = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
}

module "sql_server" {
  source                       = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/server"
  name                         = "${var.name}"
  resource_group_name          = "${module.resource_group.name}"
  location                     = "${var.location}"
  version                      = "${var.sql_server_version}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  rule_list                    = "${var.rule_list}"
}

module "create_sql_db" {
  source                           = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/database/create"
  name                             = "${var.name}"
  resource_group_name              = "${module.resource_group.name}"
  location                         = "${var.location}"
  server_name                      = "${module.sql_server.name}"
  edition                          = "${var.sql_database_edition}"
  requested_service_objective_name = "${var.requested_service_objective_name}"
}

output "sql_server_public_fqdn" {
  value = "${module.sql_server.public_fqdn}"
}

output "sql_db_id" {
  value = "${module.create_sql_db.id}"
}
