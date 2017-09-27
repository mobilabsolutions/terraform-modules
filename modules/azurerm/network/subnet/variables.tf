variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the subnet."
}

variable virtual_network_name {
  type        = "string"
  description = "(Required) The name of the virtual network to which to attach the subnet"
}

variable "subnets" {
  type        = "map"
  description = "(Required) Map of Names and CIDRs as keys and values of the subnets. One subnet will be created for each pair."
}
