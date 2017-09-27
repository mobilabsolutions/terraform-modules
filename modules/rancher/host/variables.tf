variable name {
  type        = "string"
  description = "(Required) Specifies the name of the Rancher Host resource."
}

variable count {
  type        = "string"
  description = "(Required) Number of Rancher Hosts to provision."
}

variable count_offset {
  type        = "string"
  description = "(Optional) Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,..."
  default     = "0"
}

variable count_format {
  type        = "string"
  description = "(Optional) Server numbering format (-01, -02, etc.) in printf format"
  default     = "%d"
}

variable hostname_list {
  type        = "list"
  description = "(Required) List of the host names. Used as the primary key to detect the host ID."
}

variable environment_id {
  type        = "string"
  description = "(Required) The ID of the environment to create the host for."
}
