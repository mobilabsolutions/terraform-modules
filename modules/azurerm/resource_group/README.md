## Resource Group
Creates a new resource group on Azure.

Resource Group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. See [Resource groups](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview#resource-groups).

### Example
```hcl
module "resource_group" {
  source   = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/resource_group"
  name     = "${var.name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the resource group. Must be unique on your Azure subscription. | string 
location | (Required) The location where the resource group should be created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The id of the resource group. | string
name | The name of the resource group. | string