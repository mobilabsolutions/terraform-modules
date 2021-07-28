terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = "${var.name}-kv"
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_perms

    secret_permissions = var.secret_perms
  }
}
