resource "azurerm_key_vault_key" "key" {
  name      = "${var.name}-masterkey"
  vault_uri = "${var.vault_uri}"
  key_type  = "${var.key_type}"
  key_size  = 2048
  key_opts  = "${var.key_opts}"
}
