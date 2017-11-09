data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name     = "${var.name}-kv"
  location = "${var.location}"
  tags     = "${var.tags}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    name = "${var.sku}"
  }

  tenant_id = "${data.azurerm_client_config.current.tenant_id}"

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azurerm_client_config.current.service_principal_object_id}"

    key_permissions = "${var.key_perms}"

    secret_permissions = "${var.secret_perms}"
  }

}
