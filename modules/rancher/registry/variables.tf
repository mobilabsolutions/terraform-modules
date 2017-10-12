variable name {
  type        = "string"
  description = "(Required) The name of the registry."
}

variable environment_id {
  type        = "string"
  description = "(Required) The ID of the environment to create the registry for"
}

variable registry_address {
  type        = "string"
  description = "(Required) The server address for the registry. This address shouldn't include http or https eg. hub.example.com"
}

variable registry_email {
  type        = "string"
  description = "(Required) The email of the account."
}

variable registry_credential_public {
  type        = "string"
  description = "(Required) The public value (user name) of the account."
}

variable registry_credential_private {
  type        = "string"
  description = "(Required) The secret value (password) of the account."
}
