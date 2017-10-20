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
variable account_tier {
  default = "Standard"
}

variable account_replication_type {
  default = "LRS"
}

# Virtual Machine
variable public_key {
  type = "string"
}

variable cloud_init_rendered {
  type = "string"
}

variable subnet_name {
  type = "string"
}

variable admin_username {
  type = "string"
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

variable tags {
  type = "map"

  default = {}
}
