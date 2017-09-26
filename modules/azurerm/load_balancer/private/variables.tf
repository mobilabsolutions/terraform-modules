variable name {
  type        = "string"
  description = "(Required) Specifies the name of the LoadBalancer."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the LoadBalancer."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable subnet_id {
  type        = "string"
  description = "(Required) The Id of Subnet that LoadBalancer connects to internally"
}

# Passed in a as a list of comma deliniated string lists in the format 
# ["name,protocol,front_port,rear_port,request_path", "name,protocol,front_port,rear_port,request_path", ...]
# Request Path is the URI used for requesting health status from the backend endpoint. 
# Required if protocol is set to Http. Otherwise, it is not allowed and should be supplied with empty value.
variable rule_list {
  default     = []
  description = "(Optional) Load balancing rules as list."
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
