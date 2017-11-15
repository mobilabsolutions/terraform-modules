output "network_security_group_id" {
  value = "${azurerm_network_security_group.nsg.id}"
}

output "subnet_id_list" {
  value = "${zipmap(azurerm_subnet.sb.*.address_prefix, azurerm_subnet.sb.*.id)}"
}

output "virtual_network_id" {
  value = "${azurerm_virtual_network.vn.id}"
}

output "virtual_network_name" {
  value = "${azurerm_virtual_network.vn.name}"
}

output "public_ip_list" {
  value = "${azurerm_public_ip.pi.*.ip_address}"
}

output "public_dns_list" {
  value = "${azurerm_public_ip.pi.*.fqdn}"
}

output "private_ip_list" {
  value = "${azurerm_network_interface.ni.*.private_ip_address}"
}

output "private_dns_list" {
  value = "${azurerm_network_interface.ni.*.internal_fqdn}"
}

output "network_interface_ids" {
  value = "${azurerm_network_interface.ni.*.id}"
}

output "public_ip_name_list" {
  value = "${azurerm_public_ip.pi.*.name}"
}