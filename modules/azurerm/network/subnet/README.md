## Subnet
Creates a new subnet. Subnets represent network segments within the IP space defined by the virtual network.

Subnets represent network segments within the IP space defined by the virtual network. Subnets are child resources of a virtual network. Subnets have names unique within a VNET and they can be addressed via URIs.

### Example
```hcl
module "subnet" {
  source               = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/network/subnet"
  resource_group_name  = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
  subnets              = "${var.subnets}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
resource_group_name | (Required) The name of the resource group in which to create the subnet. | string
virtual_network_name | (Required) The name of the virtual network to which to attach the subnet. | string
subnets | (Required) Map of Names and CIDRs as keys and values of the subnets. One subnet will be created for each pair. | map 

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
ids | Subnet CIDRs and ids as key value pair. | map