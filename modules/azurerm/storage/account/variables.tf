variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable account_name {
  type        = "string"
  description = "(Required) Specifies the name of the storage account. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable account_type {
  type        = "string"
  description = "(Required) Storage acount type (i.e.,  Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS)"
  default     = "Standard_LRS"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
