variable "name_prefix" {
  type        = string
  description = "The name prefix for the resource."
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
  default     = "vnet"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
  default     = "subnet"
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "address_spaces" {
  type        = list(string)
  description = "The address space that is used by the virtual network. You can supply more than one address space."
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes to use for the subnet"
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet."
}

variable "tags" {
  type        = map(any)
  description = "The mapping of tags to assign to the resource."
}
