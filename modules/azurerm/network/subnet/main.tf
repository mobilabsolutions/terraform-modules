resource "azurerm_subnet" "sb" {
  count                = "${length(keys(var.subnets))}"
  name                 = "${element(keys(var.subnets), count.index)}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.virtual_network_name}"
  address_prefix       = "${lookup(var.subnets, element(keys(var.subnets), count.index))}"
}
