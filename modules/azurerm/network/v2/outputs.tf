output "virtual_network_address_space" {
  value = azurerm_virtual_network.this.address_space
}

output "subnet_address_prefix" {
  value = azurerm_subnet.this.address_prefix
}

output "subnet_address_id" {
  value = azurerm_subnet.this.id
}