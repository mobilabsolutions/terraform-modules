resource "azurerm_sql_database" "sql_db" {
  name                             = "${var.name}-db"
  resource_group_name              = "${var.resource_group_name}"
  location                         = "${var.location}"
  server_name                      = "${var.server_name}"
  create_mode                      = "${var.create_mode}"
  source_database_id               = "${var.create_mode != "Default" ? var.source_database_id : ""}"
  restore_point_in_time            = "${var.create_mode == "PointInTimeRestore" ? var.restore_point_in_time : ""}"
  edition                          = "${var.edition}"
  collation                        = "${var.collation}"
  max_size_bytes                   = "${var.max_size_bytes}"
  requested_service_objective_name = "${var.requested_service_objective_name}"
  source_database_deletion_date    = "${var.create_mode == "Restore" ? var.source_database_deletion_date : ""}"
  elastic_pool_name                = "${var.elastic_pool_name}"

  tags = "${merge(var.tags, map("resourceType", "db"))}"
}
