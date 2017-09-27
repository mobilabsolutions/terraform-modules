resource "rancher_registration_token" "token" {
  name           = "${var.name}"
  environment_id = "${var.environment_id}"
}
