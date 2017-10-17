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

variable name {
  type        = "string"
  description = " (Required) The name of the SQL Server."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
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

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
