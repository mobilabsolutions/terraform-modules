provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

module "sql_server" {
  source              		   = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/sql/server"
  name                         = "${var.name}"
  resource_group_name          = "${module.resource_group.name}"
  location                     = "${var.location}"
  version                      = "${var.version}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  rule_list                    = "${var.rule_list}"
  tags                         = "${var.tags}"
}

module "resource_group" {
  source   = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
}

output "name" {
  value = "${module.sql_server.name}"
}

output "public_fqdn" {
  value = "${module.sql_server.public_fqdn}"
}
