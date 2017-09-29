## Network Security Group
Create a network security group that contains a list of network security rules.

A network security group (NSG) resource contains a list of network security rules. NSGs enable inbound or outbound traffic to be enabled or denied.
NSGs are created with a set of default network security rules which are designed to enable all communications from and within a virtual network, but deny external access to same.
NSGs can be assigned to subnets or individual NICs. Where NSGs are assigned to both a subnet and a NIC, the combination of both NSGs applies to that NIC.

### Example
```hcl
module "network_security_group" {
  source              = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.1.0//modules/azurerm/network/network_security_group"
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
  rule_list           = "${var.network_security_rules}"
  tags                = "${var.tags}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name | (Required) Specifies the name of the network security group. Changing this forces a new resource to be created. | string
resource_group_name | (Required) The name of the resource group in which to create the network security group. | string
location | (Required)  (Required) Specifies the supported Azure location where the resource exists. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
rule_list | (Optional) Network security rules as list. Passed in a as a list of comma deliniated string lists in a specific format. | list
tags | (Optional) A mapping of tags to assign to the resource. | map

Variables that must appear rule_list:

Name | Description | Order 
----------------- | --------- | -------- 
name | The name of the security rule. | 1
priority |  Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule. | 2
direction | The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are "Inbound” and "Outbound” | 3 
access | Specifies whether network traffic is allowed or denied. Possible values are "Allow” and "Deny”. | 4
protocol | Network protocol this rule applies to. Can be Tcp, Udp or * to match both. | 5
source_port_range | Source Port or Range. Integer or range between 0 and 65535 or * to match any | 6
destination_port_range | Destination Port or Range. Integer or range between 0 and 65535 or * to match any. | 7
source_address_prefix | CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. | 8
destination_address_prefix | CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. | 9

An example configuration can be seen below:

```hcl
rule_list = ["ssh,100,Inbound,Allow,Tcp,*,22,*,*", "http,200,Inbound,Allow,Tcp,*,80,*,*"]
```

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.



#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id | Network security group id. | string
