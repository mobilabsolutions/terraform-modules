variable name {
  type        = "string"
  description = "(Required) The name of the storage table. Must be unique within the storage account the table is located."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the storage table. Changing this forces a new resource to be created."
}

variable storage_account_name {
  type        = "string"
  description = "(Required) Specifies the storage account in which to create the storage table. Changing this forces a new resource to be created."
}
