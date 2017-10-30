## Storage Table
Create an Azure Storage Table.

Table Storage stores structured datasets. Table storage is a NoSQL key-attribute data store, which allows for rapid development and fast access to large quantities of data.

### Example
```hcl
module "storage_table" {
  source               = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/storage/table"
  name                 = "${var.name}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the storage table. Must be unique within the storage account the table is located. | string 
resource_group_name | (Required) The name of the resource group in which to create the storage table. Changing this forces a new resource to be created. | string
storage_account_name | (Required) Specifies the storage account in which to create the storage table. Changing this forces a new resource to be created. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The storage table Resource ID. | string
name | The name of the storage table. | string
