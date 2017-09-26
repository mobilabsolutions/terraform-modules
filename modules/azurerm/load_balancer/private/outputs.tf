output "backend_pool_id" {
  value = "${azurerm_lb_backend_address_pool.bp.id}"
}

output "private_ip_address" {
  value = "${azurerm_lb.int_lb.private_ip_address}"
}
