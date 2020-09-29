output "storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "storage_primary_access_key" {
  value = azurerm_storage_account.this.primary_access_key
}

output "storage_secondary_access_key" {
  value = azurerm_storage_account.this.secondary_access_key
}