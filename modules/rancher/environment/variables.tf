variable name {
  type        = "string"
  description = "(Required) The name of the environment."
}

variable orchestration {
  type        = "string"
  description = "(Required) The name of the environment."
  default     = "cattle"
}

variable description {
  type        = "string"
  description = "(Optional) The description of the environment."
  default     = ""
}
