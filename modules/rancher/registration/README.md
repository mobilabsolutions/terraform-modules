## Registration Token
Create a Rancher Registration Token resource.

Registration token is used to connect Rancher Hosts to Rancher Server.

### Example
```hcl
module "rancher_register" {
  source         = "github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/registration"
  name           = "${var.name}"
  environment_id = "${var.rancher_environment_id}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the registration token. | string 
environment_id | (Required) The ID of the environment to create the token for. | string 


Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
command | The command used to start a rancher agent for this environment. | string
registration_url | The URL to use to register new nodes to the environment. | string