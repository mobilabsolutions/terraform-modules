output vm_public_ips {
  value = "${module.virtual_machine.vm_public_ips}"
}

output vm_public_dns {
  value = "${module.virtual_machine.vm_public_dns}"
}

output vm_private_ips {
  value = "${module.virtual_machine.vm_private_ips}"
}

output vm_private_dns {
  value = "${module.virtual_machine.vm_private_dns}"
}

output lb_public_ip {
  value = "${module.load_balancer.ip_address}"
}

output lb_public_dns {
  value = "${module.load_balancer.dns_address}"
}

output lb_private_ip {
  value = "${module.load_balancer.private_ip_address}"
}
