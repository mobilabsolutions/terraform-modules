## Internal Load Balancer
Create a LoadBalancer Resource, LoadBalancer Backend Address Pool, LoadBalancer Probe and LoadBalancer Rules.

Unlike the Internet facing load balancer, the internal load balancer (ILB) directs traffic only to resources inside the cloud service or using VPN to access the Azure infrastructure. The infrastructure restricts access to the load balanced virtual IP addresses (VIPs) of a Cloud Service or a Virtual Network so that they will never be directly exposed to an Internet endpoint. This enables internal line of business (LOB) applications to run in Azure and be accessed from within the cloud or from resources on-premises.


### Example
```hcl
module "load_balancer" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/azurerm/load_balancer/private"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  rule_list           = "${var.load_balancing_rules}"
  tags                = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name | (Required) Specifies the name of the LoadBalancer. | string
resource_group_name | (Required) The name of the resource group in which to create the LoadBalancer. | string
location | (Required)  (Required) Specifies the supported Azure location where the resource exists. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
subnet_id | (Required) The Id of Subnet that LoadBalancer connects to internally. | string
rule_list | (Optional) Load balancing rules as list. Passed in a as a list of comma deliniated string lists in a specific format. | list
tags | (Optional) A mapping of tags to assign to the resource. | map

Variables that must appear rule_list:

Name | Description | Order 
----------------- | --------- | -------- 
name | Specifies the name of the LB Rule | 1
protocol |  The transport protocol for the external endpoint. Possible values are Udp or Tcp. | 2
front_port | he port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive. | 3 
rear_port | The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive. | 4
request_path | (Optional) The URI used for requesting health status from the backend endpoint. Required if protocol is set to Http. Otherwise, it is not allowed. | 5

An example configuration can be seen below:

```hcl
rule_list = ["main-http,Tcp,80,80,", "main-https,Tcp,443,443,"]
```

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.


#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
backend_pool_id | Backend Pool Id of Load Balancer | string
private_ip_address | Private Ip address of Load Balancer | string