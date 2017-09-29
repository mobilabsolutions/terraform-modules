## Virtual Network
Creates a new virtual network.

An Azure virtual network (VNet) is a representation of your own network in the cloud. It is a logical isolation of the Azure cloud dedicated to your subscription. You can fully control the IP address blocks, DNS settings, security policies, and route tables within this network. You can also connect Virtual Networks to your on-premises network. See [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

### Example
```hcl
module "virtual_network" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.0.0//modules/azurerm/network/virtual_network"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  address_space       = "${var.address_space}"
  tags                = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the virtual network. Changing this forces a new resource to be created. | string 
resource_group_name | (Required) The name of the resource group in which to create the virtual network. | string
address_space | (Required) The address space that is used the virtual network. You can supply more than one address space seperated with comma(,). Changing this forces a new resource to be created. | string
location | (Required) The location/region where the virtual network is created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The id of the virtual network. | string
name | The name of the virtual network. | string