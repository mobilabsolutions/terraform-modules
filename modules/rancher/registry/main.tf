resource "rancher_registry" "registry" {
  name           = "${var.name}-reg"
  environment_id = "${var.environment_id}"
  server_address = "${var.registry_address}"
}

resource "rancher_registry_credential" "auth" {
  name         = "${var.name}-reg-credential"
  email        = "${var.registry_email}"
  registry_id  = "${rancher_registry.registry.id}"
  public_value = "${var.registry_credential_public}"
  secret_value = "${var.registry_credential_private}"
}
