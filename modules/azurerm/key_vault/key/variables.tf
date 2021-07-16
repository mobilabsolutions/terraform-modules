variable "name" {
  type        = string
  description = "(Required) Specifies the name of the key. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the key vault."
}

variable "key_vault_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "key_size" {
  type        = number
  description = "Specifies the Size of the RSA key to create in bytes."
  default     = 2048
}

variable "key_opts" {
  type        = list(string)
  description = "List of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey."
  default     = ["encrypt", "decrypt", "sign", "verify", "wrapKey", "unwrapKey"]
}
