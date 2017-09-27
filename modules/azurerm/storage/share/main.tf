resource "azurerm_storage_share" "share" {
  name                 = "${var.name}-share"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_name = "${var.storage_account_name}"
  quota                = "${var.quota}"
}
