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

module "network" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/network"
  name                = "${var.name}"
  resource_group_name = "${module.resource_group.name}"
  location            = "${var.location}"
  address_space       = "${var.address_space}"
  subnets             = "${var.subnets}"
  rule_list           = "${var.security_group_rule_list}"
}
