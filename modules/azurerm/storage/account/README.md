## Storage Account
Create an Azure Storage Account.

An Azure storage account provides a unique namespace to store and access your Azure Storage data objects. A general-purpose storage account gives you access to Azure Storage services such as Tables, Queues, Files, Blobs and Azure virtual machine disks under a single account.

### Example
```hcl
module "storage_account" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/storage/account"
  account_name        = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tags                = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
account_name  | (Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. | string 
location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
resource_group_name | (Required) The name of the resource group in which to create the storage account. | string
account_tier | (Optional) Defines the Tier to use for this storage account. Valid options are Standard and Premium | string
account_replication_type | (Optional) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS. | string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
primary_blob_endpoint  | The endpoint URL for blob storage in the primary location. | string
name | The name of the storage account. | string
primary_access_key | The primary access key for the storage account | string
