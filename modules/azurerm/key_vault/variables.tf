variable "name" {
  type        = string
  description = "(Required) Specifies the name of the key vault. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the key vault."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
}

variable "key_perms" {
  type        = list(string)
  description = "(Optional) List of key operations client can perform. must be one or more from the following: backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey."
  default     = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "recover", "restore", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "secret_perms" {
  type        = list(string)
  description = "(Optional) List of secret operations client can perform. Must be one or more form the following: backup, delete, get, list, purge, recover, restore and set. "
  default     = ["backup", "delete", "get", "list", "recover", "restore", "set"]
}

variable "sku_name" {
  type        = string
  description = "(Optional) Specifies service tier. Possible values are standard or premium."
  default     = "standard"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
