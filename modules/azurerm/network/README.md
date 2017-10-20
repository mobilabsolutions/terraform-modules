## Network
Creates an azure network consisting of a Virtual Network and possibly multiple Network Interfaces with all of their dependencies.

An Azure virtual network (VNet) is a representation of your own network in the cloud. It is a logical isolation of the Azure cloud dedicated to your subscription. You can fully control the IP address blocks, DNS settings, security policies, and route tables within this network. You can also connect Virtual Networks to your on-premises network. See [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

Each VNet might have multiple subnets. Subnets represent network segments within the IP space defined by the virtual network. Subnets have names unique within a VNET and they can be addressed via URIs.

A Network Interface enables an Azure Virtual Machine to communicate with Internet, Azure, and on-premises resources. in order to setup a Network Interface you have associate it with a Virtual Network through a subnet. also you have to specify a Network Security Group.

A Network Security Group (NSG) resource contains a list of network security rules. NSGs enable inbound or outbound traffic to be enabled or denied. NSGs are created with a set of default network security rules which are designed to enable all communications from and within a virtual network, but deny external access to same. NSGs can be assigned to subnets or individual NICs. Where NSGs are assigned to both a subnet and a NIC, the combination of both NSGs applies to that NIC.

### Example
```hcl
module "virtual_network" {
  source                        = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=1.2.0//modules/azurerm/network/virtual_network"
  name                          = "${var.name}"
  resource_group_name           = "${module.resource_group.name}"
  location                      = "${var.location}"
  address_space                 = "${var.address_space}"
  subnets                       = "${var.subnets}"
  rule_list                     = "${var.network_security_rules}"
}
```

#### Input Reference
The following input variables are supported:

Name | Description | Type 
----------------- | --------- | -------- 
name  | (Required) The name of the virtual network. Changing this forces a new resource to be created. | string 
resource_group_name | (Required) The name of the resource group in which to create the virtual network. | string
location | (Required) The location/region where the virtual network is created. For a list of all Azure locations, please consult this [link](https://azure.microsoft.com/en-us/regions/) | string 
address_space | (Required) The address space that is used the virtual network. You can supply more than one address space seperated with comma(,). Changing this forces a new resource to be created. | string
subnets | (Required) Map of Names and CIDRs as keys and values of the subnets. One subnet will be created for each pair. | map 
rule_list | (Optional) Network security rules as list. Passed in a as a list of comma deliniated string lists in a specific format. | list
count | (Required) Number of network interfaces per VM. | string
count_offset | (Optional) Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,... | string
count_format | (Optional) Server numbering format (-01, -02, etc.) in printf format | string
lb_pool_ids | (Optional) Load balancer pool ids | list
network_interface_subnet_name | (Optional) the name of subnet chosen from subnets list | string
private_ip_address_allocation | (Optional) IP assignment for the network interface. Can be static or dynamic: if using static please set private_ip_address. | string
virtual_network_tags | (Optional) A mapping of tags to assign to the virtual network. | map
security_group_tags | (Optional) A mapping of tags to assign to the security group. | map
network_interface_tags | (Optional) A mapping of tags to assign to network interfaces. | map
public_ip_tags | (Optional) A mapping of tags to assign to public ips. | map

Default values will be overriden if they are provided as input variables. Usually variables marked as (Required) does not have default values. Check variables.tf file for more information.

#### Output Reference
The following output variables are supported:

Name | Description | Type
----------------- | --------- | --------
id  | The id of the virtual network. | string
name | The name of the virtual network. | string
public_ip_list | List of virtual machine public ips. | list
public_dns_list | List of virtual machine public dns. | list
private_ip_list | List of virtual machine private ips. | list
private_dns_list | List of virtual machine private dns. | list
