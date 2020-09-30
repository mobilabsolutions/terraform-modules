terraform {
  backend "azurerm" {
    storage_account_name = "${var.resource_group_name}tfstate"
    container_name       = "tfstate"
    key                  = "infrastructure/storage/terraform.tfstate"
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "this" {
  name                     = "${var.name_prefix}${var.account_name}"
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  tags                     = var.tags
}
