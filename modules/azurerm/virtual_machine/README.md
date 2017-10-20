## Virtual Machine
Create one or more virtual machine(s).

Microsoft Azure supports running a number of popular Linux distributions provided and maintained by a number of partners. You will find distributions such as Red Hat Enterprise, CentOS, Debian, Ubuntu, CoreOS, RancherOS, FreeBSD, and more in the Azure Marketplace. We actively work with various Linux communities to add even more flavors to the [Azure endorsed Linux Distros](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/endorsed-distros?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json) list.

When you deploy a VM in Azure, you are going to select a VM size within one of our series of sizes that is suitable to your workload. The size also affects the processing power, memory, and storage capacity of the virtual machine. You are billed based on the amount of time the VM is running and consuming its allocated resources. A complete list of [sizes of Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes?toc=%2fazure%2fvirtual-machines%2flinux%2ftoc.json).


### Example
```hcl
module "virtual_machine" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/virtual_machine"
  name                          = "${var.name}"
  location                      = "${var.location}"
  resource_group_name           = "${module.resource_group.name}"
  storage_account_name          = "${module.storage_account.name}"
  storage_primary_blob_endpoint = "${module.storage_account.primary_blob_endpoint}"
  network_interface_ids			= "${var.network_interface_ids}"
  count                         = "${var.count}"
  availability_set_id           = "${module.availability_set.id}"
  vm_size                       = "${var.vm_size}"
  image_publisher               = "${var.image_publisher}"
  image_offer                   = "${var.image_offer}"
  image_sku                     = "${var.image_sku}"
  image_version                 = "${var.image_version}"
  os_disk_name                  = "${var.os_disk_name}"
  public_key_path               = "${var.public_key_path}"
  cloud_init_rendered           = "${var.cloud_init_file}"
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
vm_size | (Required) Size of the VM. See [here](https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-sizes/). | string
storage_account_name | (Required) Azure storage account to use to store OS disk images | string
storage_primary_blob_endpoint | (Required) Azure storage blob endpoint to use to store OS disk images | string
network_interface_ids | (Required) list of interface Ids to assign | list
image_publisher | (Required) OS Image publisher | string
image_offer | (Required) OS Image offer | string
image_sku | (Required) OS Image sku | string
image_version | (Required) OS Image version | string
admin_username | (Required) Admin account username. Can't be set as root or admin. | string
public_key | (Required) ssh public key. | string
os_disk_name | (Optional) Base name of the OS disk | string
cloud_init_rendered | (Optional) Rendered cloud-init file contents | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
vm_ids  | List of virtual machine ids. | list