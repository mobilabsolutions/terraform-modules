variable domain_prefix {
  type        = string
  description = "Domaint prefix for the dns zone."
}

variable resource_group_name {
  type        = string
  description = "The resource group name."
}

variable domain_name {
  type        = string
  description = "Domain name postfix for dns zone."
}

variable tags {
  type        = map
  description = "The mapping of tags to assign to the resource."
}
