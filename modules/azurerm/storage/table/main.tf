resource "azurerm_storage_table" "table" {
  name                 = "${var.name}-table"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
}
