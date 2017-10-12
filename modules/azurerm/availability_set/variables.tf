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

variable platform_update_domain_count {
  type        = "string"
  description = "(Optional) Specifies the number of update domains that are used. Defaults to 5."
  default     = "5"
}

variable platform_fault_domain_count {
  type        = "string"
  description = "(Optional) Specifies the number of fault domains that are used. Defaults to 3."
  default     = "3"
}

variable managed {
  type        = "string"
  description = "(Optional) Specifies whether the availability set is managed or not. Possible values are true (to specify aligned) or false (to specify classic). Default is false."
  default     = "false"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
