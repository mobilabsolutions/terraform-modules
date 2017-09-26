module "resource_group" {
  source   = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}

module "virtual_network" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/network/virtual_network"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  address_space       = "${var.address_space}"
  tags                = "${var.tags}"
}

module "subnet" {
  source               = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/network/subnet"
  resource_group_name  = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
  subnets              = "${var.subnets}"
}

module "network_security_group" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/network/network_security_group"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  rule_list           = "${var.network_security_rules}"
  tags                = "${var.tags}"
}

module "storage_account" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/storage/account"
  account_name        = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  tags                = "${var.tags}"
}

module "virtual_machine" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/virtual_machine"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  storage_account_name          = "${module.storage_account.name}"
  storage_primary_blob_endpoint = "${module.storage_account.primary_blob_endpoint}"
  count                         = "1"
  subnet_ids                    = "${module.subnet.ids}"
  subnet_cidr                   = "${lookup(var.subnets,var.subnet_name)}"
  network_security_group_id     = "${module.network_security_group.id}"
  vm_size                       = "${var.vm_size}"
  image_publisher               = "${var.image_publisher}"
  image_offer                   = "${var.image_offer}"
  image_sku                     = "${var.image_sku}"
  image_version                 = "${var.image_version}"
  os_disk_name                  = "${var.os_disk_name}"
  public_key                    = "${var.public_key}"
  cloud_init                    = "${var.cloud_init}"
  ssh_users                     = "${var.ssh_users}"
  admin_username                = "${var.admin_username}"
  azure_sa_name                 = "${var.azure_sa_name}"
  azure_sa_key                  = "${var.azure_sa_key}"
  driver_version                = "${var.driver_version}"
  tags                          = "${var.tags}"
}
