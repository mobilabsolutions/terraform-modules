resource "azurerm_sql_database" "sql_db" {
  name                             = "${var.name}-db"
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.location}"
  server_name                      = "${var.server_name}"
  create_mode                      = "PointInTimeRestore"
  source_database_id               = "${var.source_database_id}"
  restore_point_in_time            = "${var.restore_point_in_time}"
  edition                          = "${var.edition}"
  collation                        = "${var.collation}"
  max_size_bytes                   = "${var.max_size_bytes}"
  requested_service_objective_name = "${var.requested_service_objective_name}"
  elastic_pool_name                = "${var.elastic_pool_name}"

  tags = "${merge(var.tags, map("resourceType", "db"))}"
}
