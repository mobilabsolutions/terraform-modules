variable "name_prefix" {
  type        = string
  description = "The name prefix for the resource."
}

variable "account_name" {
  type        = string
  description = "The storage account identifier."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "account_kind" {
  type        = string
  description = "Defines the Kind of account. Valid options are Storage, StorageV2 and BlobStorage."
  default     = "BlobStorage"
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "tags" {
  type        = map(any)
  description = "The mapping of tags to assign to the resource."
}
