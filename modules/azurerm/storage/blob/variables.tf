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
  description = "(Required) The name of the storage container in which this blob should be created."
}

variable type {
  type        = "string"
  description = "(Optional) The type of the storage blob to be created. One of either block or page. When not copying from an existing blob, this becomes required."
  default     = "page"
}

variable size {
  type        = "string"
  description = "(Optional) Used only for page blobs to specify the size in bytes of the blob to be created. Must be a multiple of 512. Defaults to 0."
  default     = "0"
}
