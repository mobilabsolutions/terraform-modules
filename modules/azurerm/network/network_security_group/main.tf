resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}-nsg"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  tags = "${merge(var.tags, map("resourceType", "nsg"))}"
}

resource "azurerm_network_security_rule" "nsr" {
  count                       = "${length(var.rule_list)}"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"

  name                       = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  priority                   = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  direction                  = "${element(split(",", element(var.rule_list, count.index)), 2)}"
  access                     = "${element(split(",", element(var.rule_list, count.index)), 3)}"
  protocol                   = "${element(split(",", element(var.rule_list, count.index)), 4)}"
  source_port_range          = "${element(split(",", element(var.rule_list, count.index)), 5)}"
  destination_port_range     = "${element(split(",", element(var.rule_list, count.index)), 6)}"
  source_address_prefix      = "${element(split(",", element(var.rule_list, count.index)), 7)}"
  destination_address_prefix = "${element(split(",", element(var.rule_list, count.index)), 8)}"
}
