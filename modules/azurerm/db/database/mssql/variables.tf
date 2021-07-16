variable "name_prefix" {
  type        = string
  description = "The name prefix for the resource."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "database_name" {
  type        = string
  description = "The name of the SQL database"
}

variable "server_name" {
  type        = string
  description = "The name of the SQL Server on which to create the database."
}

variable "create_mode" {
  type        = string
  description = "The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary."
  default     = "Default"
}

variable "collation" {
  type        = string
  description = "The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable "sku_name" {
  type        = string
  description = "Specifies the name of the sku used by the database."
  default     = "Basic"
}

variable "tags" {
  type        = map(any)
  description = "The mapping of tags to assign to the resource."
}
