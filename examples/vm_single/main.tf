provider "azurerm" {
  subscription_id = "${var.azure_subscription_id}"
  client_id       = "${var.azure_client_id}"
  client_secret   = "${var.azure_client_secret}"
  tenant_id       = "${var.azure_tenant_id}"
}

module "single_vm" {
  source                 = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.0.0//modules/azurerm/compute/single"
  name                   = "${var.name}"
  location               = "${var.location}"
  subnets                = "${var.subnets}"
  network_security_rules = "${var.network_security_rules}"
  address_space          = "${var.address_space}"
  public_key             = "${file(var.public_key_path)}"
  subnet_name            = "${var.subnet_name}"
  azure_sa_name          = "${var.azure_sa_name}"
  azure_sa_key           = "${var.azure_sa_key}"
  cloud_init             = "${file(var.cloud_init_file)}"
  ssh_users              = "${file(var.ssh_users_file)}"
  admin_username         = "${var.admin_username}"
}

output vm_public_ip {
  value = "${module.single_vm.vm_public_ip}"
}

output vm_public_dns {
  value = "${module.single_vm.vm_public_dns}"
}

output vm_private_ip {
  value = "${module.single_vm.vm_private_ip}"
}

output vm_private_dns {
  value = "${module.single_vm.vm_private_dns}"
}
