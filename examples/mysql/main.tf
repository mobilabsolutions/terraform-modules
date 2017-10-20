provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

module "resource_group" {
  source   = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
}

module "mysql_server" {
  source                       = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/mysql/server"
  name                         = "${var.name}"
  resource_group_name          = "${module.resource_group.name}"
  location                     = "${var.location}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  ssl_enforcement              = "${var.ssl_enforcement}"
  storage_mb                   = "${var.storage_mb}"
  rule_list                    = "${var.sql_firewall_rules}"
}

module "mysql_database" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/mysql/database"
  name                = "${var.name}"
  resource_group_name = "${module.resource_group.name}"
  server_name         = "${module.mysql_server.name}"
}

output "mysql_server_name" {
  value = "${module.mysql_server.name}"
}

output "public_fqdn" {
  value = "${module.mysql_server.public_fqdn}"
}

output "mysql_database_name" {
  value = "${module.mysql_database.name}"
}
