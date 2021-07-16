terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_container_registry" "this" {
  name                = "${var.name_prefix}acr"
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  admin_enabled       = var.admin_enabled
  sku                 = var.sku
  tags                = var.tags
}