variable name {
  type        = "string"
  description = "(Required) Specifies the name of the availability set. Changing this forces a new resource to be created"
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the availability set."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
