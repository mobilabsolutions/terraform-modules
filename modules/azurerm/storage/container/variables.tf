variable name {
  type        = "string"
  description = "(Required) The name of the storage container. Must be unique within the storage service the container is located."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable storage_account_name {
  type        = "string"
  description = "(Required) Specifies the storage account in which to create the storage container. Changing this forces a new resource to be created."
}

variable container_access_type {
  type        = "string"
  description = "(Required) The 'interface' for access the container provides. Can be either blob, container or private."
  default     = "private"
}
