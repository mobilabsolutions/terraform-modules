variable name {
  type        = "string"
  description = "(Required) The name of the resource group. Must be unique on your Azure subscription."
}

variable location {
  type        = "string"
  description = "(Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
