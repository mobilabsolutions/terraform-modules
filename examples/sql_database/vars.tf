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

variable sql_server_version {
  type        = "string"
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

variable sql_database_edition {
  type        = "string"
}

variable requested_service_objective_name {
  type        = "string"
  description = "Valid values are: Basic, S0, S1, S2, S3, P1, P2, P4, P6, P11, P15 and ElasticPool."
}