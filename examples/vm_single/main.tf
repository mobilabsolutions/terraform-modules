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
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  address_space       = "${var.address_space}"
  subnets             = "${var.subnets}"
  rule_list           = "${var.network_security_rules}"
}

module "storage_account" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/storage/account"
  account_name        = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}

data "template_file" "init" {
  template = "${file(var.cloud_init_file)}"

  vars {
    ssh_users     = "${file(var.ssh_users_file)}"
    azure_sa_name = "${module.storage_account.name}"
    azure_sa_key  = "${module.storage_account.primary_access_key}"
  }
}

module "virtual_machine" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/virtual_machine"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  storage_account_name          = "${module.storage_account.name}"
  storage_primary_blob_endpoint = "${module.storage_account.primary_blob_endpoint}"
  network_security_group_id     = "${module.network.network_security_group_id}"
  network_interface_ids         = "${module.network.network_interface_ids}"
  public_key                    = "${file(var.public_key_path)}"
  cloud_init_rendered           = "${data.template_file.init.rendered}"
  admin_username                = "${var.admin_username}"
}

output vm_public_ip {
  value = "${module.network.public_ip_list}"
}

output vm_public_dns {
  value = "${module.network.public_dns_list}"
}

output vm_private_ip {
  value = "${module.network.private_ip_list}"
}

output vm_private_dns {
  value = "${module.network.private_dns_list}"
}
