resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.name}-ss"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.location}"
  version                      = "${var.version}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"

  tags = "${merge(var.tags, map("resourceType", "ss"))}"
}

resource "azurerm_sql_firewall_rule" "fwr" {
  count               = "${length(var.rule_list)}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_sql_server.sql_server.name}"

  name             = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  start_ip_address = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  end_ip_address   = "${element(split(",", element(var.rule_list, count.index)), 2)}"
}
