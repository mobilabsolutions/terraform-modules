output "vm_ids" {
  value = "${azurerm_virtual_machine.vm.*.id}"
}

output "vm_public_ips" {
  value = ["${azurerm_public_ip.pi.*.ip_address}"]
}

output "vm_public_dns" {
  value = ["${azurerm_public_ip.pi.*.fqdn}"]
}

output vm_private_ips {
  value = ["${azurerm_network_interface.ni.*.private_ip_address}"]
}

output vm_private_dns {
  value = ["${azurerm_network_interface.ni.*.internal_fqdn}"]
}

output vm_names {
  value = ["${azurerm_virtual_machine.vm.*.name}"]
}
