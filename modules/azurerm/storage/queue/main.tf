resource "azurerm_storage_queue" "queue" {
  name                 = "${var.name}-queue"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
}
