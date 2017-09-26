output vm_public_ip {
  value = "${element(module.virtual_machine.vm_public_ips,0)}"
}

output vm_public_dns {
  value = "${element(module.virtual_machine.vm_public_dns,0)}"
}

output vm_private_ip {
  value = "${element(module.virtual_machine.vm_private_ips,0)}"
}

output vm_private_dns {
  value = "${element(module.virtual_machine.vm_private_dns,0)}"
}
