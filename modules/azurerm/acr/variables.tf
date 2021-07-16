variable "name_prefix" {
  type        = string
  description = "The name prefix for the resource."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "admin_enabled" {
  type        = bool
  description = "Specifies whether the admin user is enabled."
  default     = true
}

variable "sku" {
  type        = string
  description = "Stock Keeping Unit(SKU) name of the the container registry. Possible values are Basic, Standard and Premium."
  default     = "Standard"
}

variable "tags" {
  type        = map(string)
  description = "The mapping of tags to assign to the resource."
}
