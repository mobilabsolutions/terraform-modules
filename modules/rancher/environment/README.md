## Environment
Create a Rancher Environment, a Rancher Registy and a Rancher Registry Credential resource.

Rancher supports grouping resources into multiple environments. Each environment starts with a set of infrastructure services defined by the environment template used to create the environment. Each environment has its own set of resources, and is owned by one or more users or groups.

All hosts and any Rancher resources, such as containers, infrastructure services, and so on are created in and belong to an environment.

### Example
```hcl
module rancher_environment {
  source                      = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/rancher/environment"
  name                        = "${var.name}"
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
name  | (Required) The name of the environment. | string 
registry_address | (Required) The server address for the registry. | string 
registry_email | (Required) The email of the account. | string
registry_credential_public | (Required) The public value (user name) of the account. | string
registry_credential_private | (Required) The secret value (password) of the account. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | Rancher environment id. | string
