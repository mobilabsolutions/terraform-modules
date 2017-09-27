resource "azurerm_virtual_network" "vn" {
  name                = "${var.name}-vn"
  resource_group_name = "${var.resource_group_name}"
  address_space       = ["${split(",",var.address_space)}"]
  location            = "${var.location}"

  tags = "${merge(var.tags, map("resourceType", "vn"))}"
}
