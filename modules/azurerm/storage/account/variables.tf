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

variable account_tier {
  type        = "string"
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable account_replication_type {
  type        = "string"
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
