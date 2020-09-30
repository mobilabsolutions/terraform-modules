variable name_prefix {
  type        = string
  description = "The name prefix for the resource."
}

variable resource_group_name {
  type        = string
  description = "The resource group name."
}

variable server_name {
  type        = string
  description = "The name of the SQL server"
}

variable server_version {
  type        = string
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}

variable administrator_login {
  type        = string
  description = "The administrator login name for the new server."
}

variable administrator_login_password {
  type        = string
  description = "The password for the new Administrator login."
}

variable subnet_id {
  type        = string
  description = "The ID of the subnet that the SQL server will be connected to."
}

variable sql_virtual_network_rule_name {
  type        = string
  description = "The name of the SQL virtual network rule"
}

variable rule_list {
  type        = list
  description = "Azure Sql Server Firewall rules"
}

variable tags {
  type        = map
  description = "The mapping of tags to assign to the resource."
}