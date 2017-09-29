resource "azurerm_sql_database" "sql_db" {
  name                  = "${var.name}-db"
  resource_group_name   = "${var.resource_group_name}"
  location              = "${var.location}"
  server_name           = "${var.server_name}"
  create_mode           = "PointInTimeRestore"
  source_database_id    = "${var.source_database_id}"
  restore_point_in_time = "${var.restore_point_in_time}"

  tags = "${merge(var.tags, map("resourceType", "db"))}"
}
