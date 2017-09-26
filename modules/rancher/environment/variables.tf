variable name {
  type        = "string"
  description = "(Required) The name of the environment."
}

variable orchestration {
  type        = "string"
  description = "(Required) The name of the environment."
  default     = "cattle"
}

variable registry_address {
  type        = "string"
  description = "(Required) The server address for the registry."
  default     = "https://hub.mblb.net"
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
