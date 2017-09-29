## Storage Queue
Create an Azure Storage Queue.

Queue Storage provides reliable messaging for workflow processing and for communication between components of cloud services.

### Example
```hcl
module "storage_queue" {
  source               = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.0.0//modules/azurerm/storage/queue"
  name                 = "${var.name}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the storage queue. Must be unique within the storage account the queue is located. | string 
resource_group_name | (Required) The name of the resource group in which to create the storage queue. Changing this forces a new resource to be created. | string
storage_account_name | (Required) Specifies the storage account in which to create the storage queue. Changing this forces a new resource to be created. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The storage queue Resource ID. | string
name | The name of the storage queue. | string
