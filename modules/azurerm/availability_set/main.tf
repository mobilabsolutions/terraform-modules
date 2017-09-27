resource "azurerm_availability_set" "as" {
  name = "${var.name}-as"

  # Resource location
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  tags = "${merge(var.tags, map("resourceType", "as"))}"
}
