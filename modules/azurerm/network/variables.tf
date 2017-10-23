# General Settings
variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable name {
  type        = "string"
  description = "(Required) The prefix for name of virtual network, network security group, public IPs and network interfaces. Changing this forces new resources to be created."
}

variable location {
  type        = "string"
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

#Virtual Network Specific Settings
variable address_space {
  type        = "string"
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space seperated with comma(,). Changing this forces a new resource to be created."
}

variable virtual_network_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

#Subnet Specific Settings
variable "subnets" {
  type        = "map"
  description = "(Required) Map of Names and CIDRs as keys and values of the subnets. One subnet will be created for each pair."
}

#Security Group Specific Settings
# Passed in a as a list of comma deliniated string lists in the format 
# ["name,priority,direction,access,protocol,source_port_range,destination_port_range,source_address_prefix,destination_address_prefix", ...]
variable rule_list {
  type        = "list"
  description = "(Optional) Network security rules as list"
  default     = []
}

variable security_group_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

#Network Interface Specific Settings
variable count {
  type        = "string"
  description = "(Required) Number of network interfaces per VM."
  default     = "1"
}

variable count_offset {
  type        = "string"
  description = "(Optional) Start network interface numbering from this value. If you set it to 100, servers will be numbered -101, 102,..."
  default     = "0"
}

variable count_format {
  type        = "string"
  description = "(Optional) network interface numbering format (-01, -02, etc.) in printf format"
  default     = "%d"
}

variable "lb_pool_ids" {
  type        = "list"
  description = "(Optional) Load balancer pool ids"
  default     = [""]
}

variable network_interface_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable network_interface_subnet_name {
  type        = "string"
  description = ""
  default     = "default"
}

variable private_ip_address_allocation {
  type        = "string"
  description = "(Optional) IP assignment for the network interface. Can be static or dynamic: if using static please set private_ip_address"
  default     = "dynamic"
}

#Public IP Specific Settings
variable public_ip_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
