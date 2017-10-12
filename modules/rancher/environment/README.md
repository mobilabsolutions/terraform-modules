## Environment
Create a Rancher Environment resource.

Rancher supports grouping resources into multiple environments. Each environment starts with a set of infrastructure services defined by the environment template used to create the environment. Each environment has its own set of resources, and is owned by one or more users or groups.

All hosts and any Rancher resources, such as containers, infrastructure services, and so on are created in and belong to an environment.

### Example
```hcl
module rancher_environment {
  source        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/environment"
  name          = "${var.name}"
  orchestration = "${var.orchestration}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the environment. | string 
orchestration | (Optional) Must be one of cattle, swarm, mesos, windows or kubernetes. | string 
description | (Optional) The description of the environment. | string 

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | Rancher environment id. | string
