## Availability Set
Create an availability set for virtual machines.

Availability Sets are used within Microsoft Azure to ensure that virtual machines are deployed into different Update Domains and different Fault Domains. This allows Microsoft Azure to provide an SLA of 99.95% for the service provided by the virtual machines within the availability set.

### Example
```hcl
module "availability_set" {
  source              = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/availability_set"
  name                = "${var.name}"
  resource_group_name = "${module.resource_group.name}"
  tags                = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) Specifies the name of the availability set. Changing this forces a new resource to be created. | string 
resource_group_name | (Required) The name of the resource group in which to create the availability set. | string
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
platform_update_domain_count | (Optional) Specifies the number of update domains that are used. Defaults to 5. | string
platform_fault_domain_count | (Optional) Specifies the number of fault domains that are used. Defaults to 3. | string
managed | (Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false. | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The id of the availability set. | string