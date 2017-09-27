variable azure_subscription_id {
  description = "Azure Subscription ID"
}

variable azure_client_id {
  description = "Azure Client ID"
}

variable azure_client_secret {
  description = "Azure Client Secret"
}

variable azure_tenant_id {
  description = "Azure Tenant ID"
}

variable name {
  type = "string"
}

variable location {
  type = "string"
}

variable address_space {
  type = "string"
}

variable subnets {
  type = "map"
}

variable network_security_rules {
  type = "list"
}

variable subnet_name {
  type = "string"
}

variable public_key_path {
  type = "string"
}

variable azure_sa_name {
  type = "string"

  default = ""
}

variable azure_sa_key {
  type = "string"

  default = ""
}

variable cloud_init_file {
  type = "string"
}

variable ssh_users_file {
  type = "string"
}

variable admin_username {
  type = "string"
}
