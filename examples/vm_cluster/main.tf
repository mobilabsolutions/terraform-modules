provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

provider "rancher" {
  api_url    = "${var.rancher_api_url}"
  access_key = "${var.rancher_access_key}"
  secret_key = "${var.rancher_secret_key}"
}

module "rancher_environment" {
  source = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/rancher/environment"
  name   = "${var.name}"
}

module "rancher_register" {
  source         = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/rancher/registration"
  name           = "${var.name}"
  environment_id = "${module.rancher_environment.id}"
}

module "resource_group" {
  source   = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
}

module "load_balancer" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/load_balancer/public"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  rule_list           = "${var.load_balancing_rules}"
}

module "network" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/network"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  address_space                 = "${var.address_space}"
  subnets                       = "${var.subnets}"
  network_interface_subnet_name = "${var.subnet_name}"
  count                         = "${var.count}"
  rule_list                     = "${var.network_security_rules}"
  lb_pool_ids                   = "${list(module.load_balancer.backend_pool_id)}"
}

module "availability_set" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/availability_set"
  name                = "${var.name}"
  resource_group_name = "${module.resource_group.name}"
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
    rancher_host  = "${module.rancher_register.command}"
  }
}

module "virtual_machine" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/virtual_machine"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  storage_account_name          = "${module.storage_account.name}"
  storage_primary_blob_endpoint = "${module.storage_account.primary_blob_endpoint}"
  count                         = "${var.count}"
  network_security_group_id     = "${module.network.network_security_group_id}"
  network_interface_ids         = "${module.network.network_interface_ids}"
  availability_set_id           = "${module.availability_set.id}"
  public_key                    = "${file(var.public_key_path)}"
  cloud_init_rendered           = "${data.template_file.init.rendered}"
  admin_username                = "${var.admin_username}"
}

module "rancher_host" {
  source         = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/rancher/host"
  name           = "${var.name}"
  count          = "${var.count}"
  environment_id = "${module.rancher_environment.id}"
  hostname_list  = "${module.network.private_dns_list}"
}

output vm_public_ips {
  value = "${module.network.public_ip_list}"
}

output vm_public_dns {
  value = "${module.network.public_dns_list}"
}

output vm_private_ips {
  value = "${module.network.private_ip_list}"
}

output vm_private_dns {
  value = "${module.network.private_dns_list}"
}

output lb_public_ip {
  value = "${module.load_balancer.ip_address}"
}

output lb_public_dns {
  value = "${module.load_balancer.dns_address}"
}

output lb_private_ip {
  value = "${module.load_balancer.private_ip_address}"
}
