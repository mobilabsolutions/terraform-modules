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

module "rancher_register" {
  source         = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/registration"
  name           = "${var.name}"
  environment_id = "${var.rancher_environment_id}"
}

module "vm_cluster" {
  source                 = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/compute/cluster"
  name                   = "${var.name}"
  location               = "${var.location}"
  subnets                = "${var.subnets}"
  network_security_rules = "${var.network_security_rules}"
  load_balancing_rules   = "${var.load_balancing_rules}"
  count                  = "${var.count}"
  address_space          = "${var.address_space}"
  public_key             = "${file(var.public_key_path)}"
  subnet_name            = "${var.subnet_name}"
  azure_sa_name          = "${var.azure_sa_name}"
  azure_sa_key           = "${var.azure_sa_key}"
  cloud_init             = "${file(var.cloud_init_file)}"
  ssh_users              = "${file(var.ssh_users_file)}"
  admin_username         = "${var.admin_username}"
  rancher_host           = "${module.rancher_register.command}"
}

module "rancher_host" {
  source         = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/host"
  name           = "${var.name}"
  count          = "${var.count}"
  environment_id = "${var.rancher_environment_id}"
  hostname_list  = "${module.vm_cluster.vm_private_dns}"
}

output vm_public_ips {
  value = "${module.vm_cluster.vm_public_ips}"
}

output vm_public_dns {
  value = "${module.vm_cluster.vm_public_dns}"
}

output vm_private_ips {
  value = "${module.vm_cluster.vm_private_ips}"
}

output vm_private_dns {
  value = "${module.vm_cluster.vm_private_dns}"
}

output lb_public_ip {
  value = "${module.vm_cluster.lb_public_ip}"
}

output lb_public_dns {
  value = "${module.vm_cluster.lb_public_dns}"
}

output lb_private_ip {
  value = "${module.vm_cluster.lb_private_ip}"
}
