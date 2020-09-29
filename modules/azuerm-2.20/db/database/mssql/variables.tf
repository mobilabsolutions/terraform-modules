variable name_prefix {
  type        = string
  description = "The name prefix for the resource."
}

variable resource_group_name {
  type        = string
  description = "The resource group name."
}

variable database_name {
  type        = string
  description = "The name of the SQL database"
}

variable server_name {
  type        = string
  description = "The name of the SQL Server on which to create the database."
}

variable edition {
  type        = string
  description = "The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, or DataWarehouse."
}

variable collation {
  type        = string
  description = "The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable requested_service_objective_name {
  type        = string
  description = "Use requested_service_objective_name to set the performance level for the database. Valid values are: Basic, S0, S1, S2, S3, P1, P2, P4, P6, P11, P15 and ElasticPool."
}

variable tags {
  type        = map
  description = "The mapping of tags to assign to the resource."
}
