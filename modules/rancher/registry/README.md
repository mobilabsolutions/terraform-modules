## Environment
Create a Rancher Registy and a Rancher Registry Credential resource.


### Example
```hcl
module rancher_registry {
  source                      = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/registry"
  name                        = "${var.name}"
  environment_id              = "${var.rancher_environment_id}"
  registry_address            = "${var.registry_address}"
  registry_email              = "${var.registry_email}"
  registry_credential_public  = "${var.registry_credential_public}"
  registry_credential_private = "${var.registry_credential_private}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the registry. | string 
environment_id | (Required) The ID of the environment to create the token for. | string
registry_address | (Required) The server address for the registry. | string 
registry_email | (Required) The email of the account. | string
registry_credential_public | (Required) The public value (user name) of the account. | string
registry_credential_private | (Required) The secret value (password) of the account. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) do not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | Rancher registry id. | string
