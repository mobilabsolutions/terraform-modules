provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

module "resource_group" {
  source   = "github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
}

module "azurerm_key_vault" {
  source               = "github.com/mobilabsolutions/terraform-modules.git?ref=1.3.0//modules/azurerm/key_vault"
  name                 = "${var.name}"
  resource_group_name  = "${module.resource_group.name}"
  location             = "${var.location}"
}

module "azurerm_key_vault_key" {
  source               = "github.com/mobilabsolutions/terraform-modules.git?ref=1.3.0//modules/azurerm/key_vault/key"
  name                 = "${var.name}"
  vault_uri  = "${module.azurerm_key_vault.uri}"
  key_type             = "${var.key_type}"
  key_opts             = "${var.key_opts}"
}

output "key_vault_id" {
  value = "${module.azurerm_key_vault.id}"
}

output "key_vault_uri" {
  value = "${module.azurerm_key_vault.uri}"
}

output "key_id" {
  value = "${module.azurerm_key_vault_key.id}"
}

output "key_version" {
  value = "${module.azurerm_key_vault_key.version}"
}