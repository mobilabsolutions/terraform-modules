resource "azurerm_storage_account" "sa" {
  name                = "${var.account_name}sa"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  account_type        = "${var.account_type}"

  tags = "${merge(var.tags, map("resourceType", "sa"))}"
}
