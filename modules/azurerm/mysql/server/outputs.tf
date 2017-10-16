output id {
  value = "${azurerm_mysql_server.mysql_server.id}"
}

output name {
  value = "${azurerm_mysql_server.mysql_server.name}"
}

output public_fqdn {
  value = "${azurerm_mysql_server.mysql_server.fqdn}"
}
