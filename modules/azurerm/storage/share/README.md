## Storage Share
Create an Azure Storage Share.

File Storage offers shared storage for legacy applications using the standard SMB protocol. Azure virtual machines and cloud services can share file data across application components via mounted shares, and on-premises applications can access file data in a share via the File service REST API.

### Example
```hcl
module "storage_share" {
  source               = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/storage/share"
  name                 = "${var.name}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the share. Must be unique within the storage account where the share is located. | string 
resource_group_name | (Required) The name of the resource group in which to create the share. Changing this forces a new resource to be created. | string
storage_account_name | (Required) Specifies the storage account in which to create the share. Changing this forces a new resource to be created. | string
quota | (Optional) The maximum size of the share, in gigabytes. Must be greater than 0, and less than or equal to 5 TB (5120 GB). Default this is set to 0 which results in setting the quota to 5 TB. | string


Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | The storage share Resource ID. | string
name | The name of the storage share. | string
url | The URL of the share | string
