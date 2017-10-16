variable name {
  type        = "string"
  description = "(Required) Specifies the name of the MySQL Database, which needs to be a valid MySQL identifier. Changing this forces a new resource to be created."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which the MySQL Server exists. Changing this forces a new resource to be created."
}

variable server_name {
  type        = "string"
  description = "(Required) Specifies the name of the MySQL Server. Changing this forces a new resource to be created."
}

variable charset {
  type        = "string"
  description = "(Required) Specifies the Charset for the MySQL Database, which needs to be a valid MySQL Charset. Changing this forces a new resource to be created."
  default     = "utf8"
}

variable collation {
  type        = "string"
  description = "(Required) Specifies the Collation for the MySQL Database, which needs to be a valid MySQL Collation. Changing this forces a new resource to be created."
  default     = "utf8_general_ci"
}
