resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = "${var.location}"

  tags = "${merge(var.tags, map("resourceType", "rg"))}"
}
