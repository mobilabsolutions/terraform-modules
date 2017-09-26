variable name {
  type        = "string"
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the virtual network."
}

variable address_space {
  type        = "string"
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space seperated with comma(,). Changing this forces a new resource to be created."
}

variable location {
  type        = "string"
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
