variable name {
  type        = "string"
  description = "(Required) The name of the share. Must be unique within the storage account where the share is located."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the share. Changing this forces a new resource to be created."
}

variable storage_account_name {
  type        = "string"
  description = "(Required) Specifies the storage account in which to create the share. Changing this forces a new resource to be created."
}

variable quota {
  type        = "string"
  description = "(Optional) The maximum size of the share, in gigabytes. Must be greater than 0, and less than or equal to 5 TB (5120 GB). Default this is set to 0 which results in setting the quota to 5 TB."
  default     = "0"
}
