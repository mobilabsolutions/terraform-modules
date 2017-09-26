variable name {
  type        = "string"
  description = "(Required) The name of the certificate."
}

variable ssl_public {
  type        = "string"
  description = "(Required) The certificate content."
}

variable ssl_private {
  type        = "string"
  description = "(Required) The certificate key."
}

variable ssl_chain {
  type        = "string"
  description = " (Optional) The certificate chain."
  default     = ""
}

variable environment_id {
  type        = "string"
  description = "(Required) The ID of the environment to create the certificate for."
}
