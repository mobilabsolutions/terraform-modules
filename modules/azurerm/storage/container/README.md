## Storage Container
Create an Azure Storage Container.

An Azure storage account provides a unique namespace to store and access your Azure Storage data objects. A general-purpose storage account gives you access to Azure Storage services such as Tables, Queues, Files, Blobs and Azure virtual machine disks under a single account.

### Example
```hcl
module "storage_container" {
  source               = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.0.0//modules/azurerm/storage/container"
  name                 = "${var.name}"
  storage_account_name = "${var.storage_account_name}"
  resource_group_name  = "${var.resource_group_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the storage container. Must be unique within the storage service the container is located. | string 
resource_group_name | (Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created. | string
storage_account_name | ((Required) Specifies the storage account in which to create the storage container. Changing this forces a new resource to be created. | string 
container_access_type | (Required) The 'interface' for access the container provides. Can be either blob, container or private. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The storage container Resource ID. | string
name | The name of the storage container. | string
