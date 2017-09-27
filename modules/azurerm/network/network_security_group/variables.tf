variable name {
  type        = "string"
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the network security group."
}

variable location {
  type        = "string"
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

# Passed in a as a list of comma deliniated string lists in the format 
# ["name,priority,direction,access,protocol,source_port_range,destination_port_range,source_address_prefix,destination_address_prefix", ...]
variable rule_list {
  type        = "list"
  description = "(Optional) Network security rules as list"
  default     = []
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
