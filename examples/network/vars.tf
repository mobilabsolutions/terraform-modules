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

variable address_space {
  type        = "string"
}

variable "subnets" {
  type        = "map"
  description = "(Required) Map of Names and CIDRs as keys and values of the subnets. One subnet will be created for each pair."
}

variable security_group_rule_list {
  type        = "list"
  description = "(Optional) Network security rules as list"
}
