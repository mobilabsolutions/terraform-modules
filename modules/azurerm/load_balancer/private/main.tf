resource "azurerm_lb" "int_lb" {
  name = "${var.name}-int-lb"

  # Resource location
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  frontend_ip_configuration {
    name      = "${lower(var.name)}-fe-ip-int-lb"
    subnet_id = "${var.subnet_id}"
  }

  tags = "${merge(var.tags, map("resourceType", "lb"))}"
}

resource "azurerm_lb_backend_address_pool" "bp" {
  resource_group_name = "${var.resource_group_name}"
  loadbalancer_id     = "${azurerm_lb.int_lb.id}"
  name                = "${lower(var.name)}-bp"
}

resource "azurerm_lb_probe" "pb" {
  count               = "${length(var.rule_list)}"
  resource_group_name = "${var.resource_group_name}"
  loadbalancer_id     = "${azurerm_lb.int_lb.id}"

  name         = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  protocol     = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  port         = "${element(split(",", element(var.rule_list, count.index)), 3)}"
  request_path = "${element(split(",", element(var.rule_list, count.index)), 4)}"
}

resource "azurerm_lb_rule" "rule" {
  count = "${length(var.rule_list)}"

  resource_group_name     = "${var.resource_group_name}"
  loadbalancer_id         = "${azurerm_lb.int_lb.id}"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.bp.id}"

  name          = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  protocol      = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  frontend_port = "${element(split(",", element(var.rule_list, count.index)), 2)}"
  backend_port  = "${element(split(",", element(var.rule_list, count.index)), 3)}"
  probe_id      = "${element(azurerm_lb_probe.pb.*.id, count.index)}"

  frontend_ip_configuration_name = "${azurerm_lb.int_lb.frontend_ip_configuration.0.name}"
}
