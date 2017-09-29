## Load Balancer
Create a LoadBalancer Resource, LoadBalancer Backend Address Pool, LoadBalancer Probe and LoadBalancer Rules.

An Azure load balancer is a Layer-4 (TCP, UDP) load balancer that provides high availability by distributing incoming traffic among healthy VMs. A load balancer health probe monitors a given port on each VM and only distributes traffic to an operational VM.
You define a front-end IP configuration that contains one or more public IP addresses. This front-end IP configuration allows your load balancer and applications to be accessible over the Internet.
Virtual machines connect to a load balancer using their virtual network interface card (NIC). To distribute traffic to the VMs, a back-end address pool contains the IP addresses of the virtual (NICs) connected to the load balancer.
To control the flow of traffic, you define load balancer rules for specific ports and protocols that map to your VMs.


### Example
```hcl
module "load_balancer" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.0.0//modules/azurerm/load_balancer/public"
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
ip_address | Public Ip address of Load Balancer | string
dns_address | DNS address of Load Balancer | string
backend_pool_id | Backend Pool Id of Load Balancer | string
private_ip_address | Private Ip address of Load Balancer | string