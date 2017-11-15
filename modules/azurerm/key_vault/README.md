## Key Vault
Creates a new key vault on Azure.

Azure Key Vault helps safeguard cryptographic keys and secrets used by cloud applications and services. By using Key Vault, you can encrypt keys and secrets (such as authentication keys, storage account keys, data encryption keys, .PFX files, and passwords) by using keys that are protected by hardware security modules (HSMs). Key Vault streamlines the key management process and enables you to maintain control of keys that access and encrypt your data.

### Example
```hcl
module "key_vault" {
  source    = "github.com/mobilabsolutions/terraform-modules.git?ref=1.3.0//modules/azurerm/key_vault"
  name      = "${var.name}"
  location  = "${var.location}"
  tags      = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name | (Required) The name of the key vault. Must be unique on your Azure subscription. | string 
location | (Required) The location where the key vault should be created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
key_perms | (Optional) List of key operations client can perform. must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey. Defaults to all but update & purge. | list
secret_perms | (Optional) List of secret operations client can perform. Must be one or more form the following: backup, delete, get, list, purge, recover, restore and set. Defaults to all but purge.
sku | (Optional) Specifies service tier. standard or premium. Default is standard.| string
tags | (Optional) A mapping of tags to assign to the resource. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The Key Vault ID. | string
uri | The URI of the vault for performing operations on keys and secrets. | string