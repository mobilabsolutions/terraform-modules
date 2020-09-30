terraform {
  backend "azurerm" {
    storage_account_name = "${var.resource_group_name}tfstate"
    container_name       = "tfstate"
    key                  = "infrastructure/dns/terraform.tfstate"
  }
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_dns_zone" "this" {
  name                = "${var.domain_prefix}.${var.domain_name}"
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = var.tags
}