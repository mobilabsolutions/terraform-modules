variable name {
  type        = "string"
  description = "(Required) The name of the storage queue. Must be unique within the storage account the queue is located."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the storage queue. Changing this forces a new resource to be created."
}

variable storage_account_name {
  type        = "string"
  description = "(Required) Specifies the storage account in which to create the storage queue. Changing this forces a new resource to be created."
}
