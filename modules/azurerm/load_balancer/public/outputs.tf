output "ip_address" {
  value = "${azurerm_public_ip.pi.ip_address}"
}

output "dns_address" {
  value = "${azurerm_public_ip.pi.fqdn}"
}

output "backend_pool_id" {
  value = "${azurerm_lb_backend_address_pool.bp.id}"
}

# output "private_ip_address" {
#   value = "${azurerm_lb.lb.private_ip_address}"
# }
