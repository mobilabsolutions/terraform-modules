variable "azure_subscription_id" {
  description = "Azure Subscription ID"
}

variable "azure_client_id" {
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
}

variable "name" {
  type = "string"
}

variable "location" {
  type = "string"
}

variable version {
  type        = "string"
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"
}

variable administrator_login {
  type        = "string"
  description = "(Required) The administrator login name for the new server."
}

variable administrator_login_password {
  type        = "string"
  description = "(Required) The password for the new AdministratorLogin."
}

# Passed in a as a list of comma deliniated string lists in the format 
# ["name,start_ip_address,end_ip_address", "name,start_ip_address,end_ip_address", ...]
variable rule_list {
  type        = "list"
  description = "(Optional) Azure Sql Server Firewall rules"
  default     = []
}

variable sql_server_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
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

variable sql_db_tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
