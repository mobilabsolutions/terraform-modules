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

module "sa" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/storage/account"
  account_name        = "${var.name}"
  resource_group_name = "${module.resource_group.name}"
}

output "name" {
  value = "${module.sa.name}"
}

output "primary_access_key" {
  value = "${module.sa.primary_access_key}"
}
