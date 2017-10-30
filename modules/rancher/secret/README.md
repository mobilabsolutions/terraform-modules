## Secret
Creates a Rancher Secret resource.

Rancher has introduced the ability to create named secrets to be used in containers. Secrets are created and scoped at an environment level, which means there can only be one secret with the same name in an environment. Any container in the same environment can share the same secrets. For example, a database password, i.e. db_password, can be used in a database container and a Wordpress container. Once a secret is created, the secret value cannot be edited or updated. If you need to change an existing value of a secret, the only way to do so is to delete the secret. After a secret has been updated, any services using the secret will need to be re-launched with the updated secret.

### Example
```hcl
module "rancher_secret" {
  source         = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/secret"
  name           = "${var.name}-db-pw"
  description    = "${var.name} DB password"
  environment_id = "${var.rancher_environment_id}"
  value          = "${var.database_password}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the secret. | string 
description | (Optional) The description of the secret. | string 
environment_id | (Required) The environment id to create the secret | string
value | (Required) The value of the secret. | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The secret Resource ID. | string
name  | The name of the secret. | string
description  | The description of the secret. | string

