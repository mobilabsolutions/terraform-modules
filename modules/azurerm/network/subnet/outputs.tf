output "ids" {
  value = "${zipmap(
    azurerm_subnet.sb.*.address_prefix, azurerm_subnet.sb.*.id
  )}"
}
