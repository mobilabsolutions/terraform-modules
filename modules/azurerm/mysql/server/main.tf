resource "azurerm_mysql_server" "mysql_server" {
  name                = "${var.name}-ss"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  sku {
    name     = "${var.sku_name}"
    capacity = "${var.sku_capacity}"
    tier     = "${var.sku_tier}"
  }

  version                      = "${var.version}"
  administrator_login          = "${var.administrator_login}"
  administrator_login_password = "${var.administrator_login_password}"
  storage_mb                   = "${var.storage_mb}"
  ssl_enforcement              = "${var.ssl_enforcement}"

  tags = "${merge(var.tags, map("resourceType", "ss"))}"
}

resource "azurerm_mysql_firewall_rule" "fwr" {
  count               = "${length(var.rule_list)}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_mysql_server.mysql_server.name}"

  name             = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  start_ip_address = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  end_ip_address   = "${element(split(",", element(var.rule_list, count.index)), 2)}"
}

resource "azurerm_mysql_configuration" "conf" {
  count               = "${length(var.configuration_list)}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_mysql_server.mysql_server.name}"

  name  = "${element(split(",", element(var.configuration_list, count.index)), 0)}"
  value = "${element(split(",", element(var.configuration_list, count.index)), 1)}"
}
