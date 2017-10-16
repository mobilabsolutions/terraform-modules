variable name {
  type        = "string"
  description = "(Required) Specifies the name of the MySQL Server. Changing this forces a new resource to be created."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the MySQL Server."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable sku_name {
  type        = "string"
  description = "(Required) Specifies the SKU Name for this MySQL Server. Possible values are: MYSQLB50, MYSQLB100, MYSQLS100, MYSQLS200, MYSQLS400 and MYSQLS800."
  default     = "MYSQLB50"
}

variable sku_capacity {
  type        = "string"
  description = "(Required) Specifies the DTU's for this MySQL Server. Possible values are 50 and 100 DTU's when using a Basic SKU and 100, 200, 400 or 800 when using the Standard SKU."
  default     = "50"
}

variable sku_tier {
  type        = "string"
  description = "(Required) Specifies the SKU Tier for this MySQL Server. Possible values are Basic and Standard."
  default     = "Basic"
}

variable version {
  type        = "string"
  description = " (Required) Specifies the version of MySQL to use. Valid values are 5.6 and 5.7. Changing this forces a new resource to be created."
  default     = "5.7"
}

variable administrator_login {
  type        = "string"
  description = "(Required) The Administrator Login for the MySQL Server. Changing this forces a new resource to be created."
}

variable administrator_login_password {
  type        = "string"
  description = "(Required) The Password associated with the administrator_login for the MySQL Server."
}

variable ssl_enforcement {
  type        = "string"
  description = "(Required) Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = "Enabled"
}

# Passed in a as a list of comma deliniated string lists in the format 
# ["name,start_ip_address,end_ip_address", "name,start_ip_address,end_ip_address", ...]
variable rule_list {
  type        = "list"
  description = "(Optional) MySql Server Firewall rules"
  default     = []
}

# Passed in a as a list of comma deliniated string lists in the format 
# ["name,value", "name,value", ...]
variable configuration_list {
  type        = "list"
  description = "(Optional) MySql Server Configuration rules. Needs to be a valid MySQL configuration."
  default     = []
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable storage_mb {
  type        = "string"
  description = "(Required) Specifies the amount of storage for the MySQL Server in Megabytes. Possible values for storage_mb when using a SKU Name of Basic are: - 51200 (50GB) - 179200 (175GB) - 307200 (300GB) - 435200 (425GB) - 563200 (550GB) - 691200 (675GB) - 819200 (800GB) - 947200 (925GB). Possible values for storage_mb when using a SKU Name of Standard are: - 128000 (125GB) - 256000 (256GB) - 384000 (384GB) - 512000 (512GB) - 640000 (640GB) - 768000 (768GB) - 896000 (896GB) - 1024000 (1TB). Changing this forces a new resource to be created."
}
