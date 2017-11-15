variable name {
  type        = "string"
  description = "(Required) Specifies the name of the virtual machine resource. Changing this forces a new resource to be created."
}

variable resource_group_name {
  type        = "string"
  description = "(Required) The name of the resource group in which to create the virtual machine."
}

variable location {
  type        = "string"
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. For a list of all Azure locations, please consult this link: https://azure.microsoft.com/en-us/regions/"
  default     = "West Europe"
}

variable count {
  type        = "string"
  description = "(Required) Number of VMs to provision."
  default     = "1"
}

variable count_offset {
  type        = "string"
  description = "(Optional) Start server numbering from this value. If you set it to 100, servers will be numbered -101, 102,..."
  default     = "0"
}

variable count_format {
  type        = "string"
  description = "(Optional) Server numbering format (-01, -02, etc.) in printf format"
  default     = "%d"
}

variable availability_set_id {
  type        = "string"
  description = "(Optional) The Id of the Availability Set in which to create the virtual machine."
  default     = ""
}

variable network_security_group_id {
  type        = "string"
  description = "(Optional) Network security group id to attach to instance"
  default     = ""
}

variable network_interface_ids {
  type        = "list"
  description = "(Required) List of network network interface ids"
}

variable vm_size {
  type        = "string"
  description = "(Required) Size of the VM. See https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-windows-sizes/"
  default     = "Standard_A2_v2"
}

# Storage account to use
variable storage_account_name {
  type        = "string"
  description = "(Required) Azure storage account to use to store OS disk images"
}

variable storage_primary_blob_endpoint {
  type        = "string"
  description = "(Required) Azure storage blob endpoint to use to store OS disk images"
}

# Images to use
# See https://github.com/Azure/azure-quickstart-templates/blob/master/101-vm-simple-windows/azuredeploy.json
variable image_publisher {
  type        = "string"
  description = "(Required) OS Image publisher"
  default     = "Canonical"
}

variable image_offer {
  type        = "string"
  description = "(Required) OS Image offer"
  default     = "UbuntuServer"
}

variable image_sku {
  type        = "string"
  description = "(Required) OS Image sku"
  default     = "16.04.0-LTS"
}

variable image_version {
  type        = "string"
  description = "(Required) OS Image version"
  default     = "latest"
}

variable admin_username {
  type        = "string"
  description = "(Required) Admin account username. Can't be set as root or admin."
}

variable public_key {
  type        = "string"
  description = "(Required) ssh public key"
}

variable os_disk_name {
  type        = "string"
  description = "(Optional) Base name of the OS disk"
  default     = "osdisk"
}

variable cloud_init_rendered {
  type        = "list"
  description = "(Optional) Rendered cloud-init file contents as list. Element count in the list should be one or should be equal to count variable."
  default     = [""]
}

variable tags {
  type        = "map"
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
