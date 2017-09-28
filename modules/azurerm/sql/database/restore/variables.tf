variable name {
  type        = "string"
  description = "(Required) The name of the SQL Database."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the sql database."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable server_name {
  type        = "string"
  description = "(Required) The name of the SQL Server on which to create the database."
}

variable source_database_id {
  type        = "string"
  description = "(Required) The URI of the source database."
}

variable restore_point_in_time {
  type        = "string"
  description = "(Required) The point in time for the restore e.g. 2013-11-08T22:00:40Z"
}

variable edition {
  type        = "string"
  description = "(Optional) The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, or DataWarehouse."
  default     = "Standard"
}

variable collation {
  type        = "string"
  description = "(Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS"
  default     = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable max_size_bytes {
  type        = "string"
  description = "(Optional) The maximum size that the database can grow to. Applies only if create_mode is Default."
  default     = "268435456000"
}

variable requested_service_objective_name {
  type        = "string"
  description = "(Optional) Use requested_service_objective_name to set the performance level for the database. Valid values are: Basic, S0, S1, S2, S3, P1, P2, P4, P6, P11, P15 and ElasticPool."
  default     = "S0"
}

variable elastic_pool_name {
  type        = "string"
  description = "(Optional) The name of the elastic database pool."
  default     = ""
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
