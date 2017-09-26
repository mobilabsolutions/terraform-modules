# Only name of the variables and default values are declared here to avoid clutter. Please check specified modules for detailed descriptions.

# General Resources
variable name {
  type = "string"
}

variable location {
  type = "string"
}

# Virtual Network
variable address_space {
  type = "string"
}

# Subnet
variable subnets {
  type = "map"
}

# Network Security Group
variable network_security_rules {
  type = "list"
}

#Load Balancer
variable load_balancing_rules {
  type = "list"
}

#Storage Account
variable account_type {
  default = "Standard_LRS"
}

# Virtual Machine
variable public_key {
  type = "string"
}

variable cloud_init {
  type = "string"
}

variable ssh_users {
  type = "string"
}

variable subnet_name {
  type = "string"
}

variable admin_username {
  type = "string"

  default = "mblb"
}

variable count {
  type = "string"
}

variable vm_size {
  type = "string"

  default = "Standard_A2_v2"
}

variable image_publisher {
  type = "string"

  default = "Canonical"
}

variable image_offer {
  type = "string"

  default = "UbuntuServer"
}

variable image_sku {
  type = "string"

  default = "16.04.0-LTS"
}

variable image_version {
  type = "string"

  default = "latest"
}

variable os_disk_name {
  type = "string"

  default = "osdisk"
}

variable azure_sa_name {
  type = "string"

  default = ""
}

variable azure_sa_key {
  type = "string"

  default = ""
}

variable driver_version {
  type = "string"

  default = "v0.5.1"
}

variable rancher_host {
  type = "string"

  default = ""
}

variable tags {
  type = "map"

  default = {}
}
