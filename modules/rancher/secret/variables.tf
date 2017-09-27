variable name {
  type        = "string"
  description = "(Required) The name of the secret."
}

variable description {
  type        = "string"
  description = "(Optional) A description of the secret."
  default     = ""
}

variable environment_id {
  type        = "string"
  description = "(Required) The ID of the environment to create the secret for."
}

variable value {
  type        = "string"
  description = "(Required) The secret value"
}
