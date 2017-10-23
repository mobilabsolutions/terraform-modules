output vm_public_ips {
  value = "${module.network.public_ip_list}"
}

output vm_public_dns {
  value = "${module.network.public_dns_list}"
}

output vm_private_ips {
  value = "${module.network.private_ip_list}"
}

output vm_private_dns {
  value = "${module.network.private_dns_list}"
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
