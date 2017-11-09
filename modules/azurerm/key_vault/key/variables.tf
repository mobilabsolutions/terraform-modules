variable name {
  type        = "string"
  description = "(Required) Specifies the name of the key. Changing this forces a new resource to be created."
}

variable key_type {
  type        = "string"
  description = "(Required) Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), Oct (Octet), RSA and RSA-HSM."
}

variable vault_uri {
  type        = "string"
  description = "(Required) Specifies the URI used to access the Key Vault instance, available on the azurerm_key_vault resource."
}

variable key_opts {
  type        = "list"
  description = "(Required) list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey."
}