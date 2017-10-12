## Blob Storage
Create an Azure Blob Storage.

Blob Storage stores unstructured object data. A blob can be any type of text or binary data, such as a document, media file, or application installer. Blob storage is also referred to as Object storage.

### Example
```hcl
module "blob_storage" {
  source                = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/storage/blob"
  name                  = "${var.name}"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${var.storage_account_name}"
  storage_continer_name = "${var.storage_continer_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name | (Required) The name of the storage blob. Must be unique within the storage container the blob is located. | string 
resource_group_name | (Required) The name of the resource group in which to create the storage container. Changing this forces a new resource to be created. | string
storage_account_name | (Required) Specifies the storage account in which to create the storage container. Changing this forces a new resource to be created. | string
storage_container_name | (Required) The name of the storage container in which this blob should be created. | string
type | (Optional) The type of the storage blob to be created. One of either block or page. When not copying from an existing blob, this becomes required. | string
size | (Optional) Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512. Defaults to 0. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The storage blob Resource ID | string
name | The name of the storage blob. | string
url | The URL of the blob | string
