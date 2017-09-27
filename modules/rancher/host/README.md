## Host
Creates a Rancher Host resource.

Hosts are the most basic unit of resource within Rancher and is represented as any Linux server, virtual or physical. A host gets connected to Rancher server when the Rancher agent container is started on the host.


### Example
```hcl
module "rancher_host" {
  source         = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/rancher/host"
  name           = "${var.name}"
  count          = "${var.count}"
  environment_id = "${var.rancher_environment_id}"
  hostname_list  = "${var.hostname_list}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) Specifies the name of the Rancher Host resource. | string 
count | (Required) Number of Rancher Hosts to provision. | string 
environment_id | (Required) The environment id to create the host | string
hostname_list | (Required) List of the host names. Used as the primary key to detect the host ID. | list
count_offset | (Optional) Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,... | string
count_format | (Optional) Server numbering format (-01, -02, etc.) in printf format | String

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
ids  | The list of the Rancher Host Resource IDs. | string

