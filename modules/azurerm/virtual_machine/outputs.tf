output "vm_ids" {
  value = "${azurerm_virtual_machine.vm.*.id}"
}

output vm_names {
  value = ["${azurerm_virtual_machine.vm.*.name}"]
}
