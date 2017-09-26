## Virtual Machine
Create one or more virtual machine(s).

Microsoft Azure supports running a number of popular Linux distributions provided and maintained by a number of partners. You will find distributions such as Red Hat Enterprise, CentOS, Debian, Ubuntu, CoreOS, RancherOS, FreeBSD, and more in the Azure Marketplace. We actively work with various Linux communities to add even more flavors to the [Azure endorsed Linux Distros](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/endorsed-distros?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json) list.

When you deploy a VM in Azure, you are going to select a VM size within one of our series of sizes that is suitable to your workload. The size also affects the processing power, memory, and storage capacity of the virtual machine. You are billed based on the amount of time the VM is running and consuming its allocated resources. A complete list of [sizes of Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json).


### Example
```hcl
module "virtual_machine" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/virtual_machine"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  storage_account_name          = "${module.storage_account.name}"
  storage_primary_blob_endpoint = "${module.storage_account.primary_blob_endpoint}"
  count                         = "${var.count}"
  subnet_ids                    = "${module.subnet.ids}"
  subnet_cidr                   = "${lookup(var.subnets,var.subnet_name)}"
  network_security_group_id     = "${module.network_security_group.id}"
  availability_set_id           = "${module.availability_set.id}"
  lb_pool_ids                   = "${list(module.load_balancer.backend_pool_id)}"
  vm_size                       = "${var.vm_size}"
  image_publisher               = "${var.image_publisher}"
  image_offer                   = "${var.image_offer}"
  image_sku                     = "${var.image_sku}"
  image_version                 = "${var.image_version}"
  os_disk_name                  = "${var.os_disk_name}"
  public_key_path               = "${var.public_key_path}"
  cloud_init_file               = "${var.cloud_init_file}"
  ssh_users_file                = "${var.ssh_users_file}"
  admin_username                = "${var.admin_username}"
  azure_sa_name                 = "${var.azure_sa_name}"
  azure_sa_key                  = "${var.azure_sa_key}"
  driver_version                = "${var.driver_version}"
  rancher_host                  = "${var.rancher_host}"
  tags                          = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) Specifies the name of the virtual machine resource. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. | string 
resource_group_name | (Required) The name of the resource group in which to create the virtual machine. | string
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
count | (Required) Number of VMs to provision. | string
count_offset | (Optional) Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,... | string
count_format | (Optional) Server numbering format (-01, -02, etc.) in printf format | string
availability_set_id | (Optional) The Id of the Availability Set in which to create the virtual machine. | string
subnet_ids | (Required) Subnets for the network interface. | map
subnet_cidr | Required) CIDR of the Subnet for the network interface. | string
private_ip_address_allocation | (Optional) IP assignment for the network interface. Can be static or dynamic: if using static please set private_ip_address. | string
private_ip_addresses | (Optional) Private IP address for the network interface. Required if private_ip_address_allocation is static. | list
network_security_group_id | (Optional) Network security group id to attach to instance. | string
lb_pool_ids | (Optional) Load balancer pool ids | list
vm_size | (Required) Size of the VM. See [here](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-sizes/). | string
storage_account_name | (Required) Azure storage account to use to store OS disk images | string
storage_primary_blob_endpoint | (Required) Azure storage blob endpoint to use to store OS disk images | string
image_publisher | (Required) OS Image publisher | string
image_offer | (Required) OS Image offer | string
image_sku | (Required) OS Image sku | string
image_version | (Required) OS Image version | string
admin_username | (Required) Admin account username. Can't be set as root or admin. | string
public_key | (Required) ssh public key. | string
os_disk_name | (Optional) Base name of the OS disk | string
cloud_init | (Required) cloud-init file contents | string
ssh_users | (Required) ssh users file contents | string
azure_sa_name | (Optional) Storage account name of Azure Storage Account which keeps Rancher Server data | string
azure_sa_key | (Optional) Storage account key of Azure Storage Account which keeps Rancher data | string
driver_version | (Optional) azurefile-driverdockervolume version. See [here](https://github.com/Azure/azurefile-dockervolumedriver)
rancher_host | (Optional) Rancher host connect command with rancher/agent | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
vm_ids  | List of virtual machine ids. | list
vm_public_ips | List of virtual machine public ips. | list
vm_public_dns | List of virtual machine public dns. | list
vm_private_ips | List of virtual machine private ips. | list
vm_private_dns | List of virtual machine private dns. | list
