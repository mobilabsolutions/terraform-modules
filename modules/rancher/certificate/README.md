## Environment
Create a Rancher Certificate resource.

Certificates loaded in the environment can be used for SSL termination of a load balancer or TLS termination for a Kubernetes Ingress.


### Example
```hcl
module rancher_certificate {
  source                      = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/rancher/certificate"
  name                        = "${var.name}"
  ssl_public                  = "${file(var.ssl_public)}"
  ssl_private                 = "${file(var.ssl_private)}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the environment. | string 
ssl_public | (Required) The certificate content. | string
ssl_private | (Required) The certificate key. | string
ssl_chain | (Optional) The certificate chain. | string
environment_id | (Required) The environment id to create the certificate | string

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | Rancher certificate id. | string
