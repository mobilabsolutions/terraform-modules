resource "rancher_secret" "secret" {
  name           = "${var.name}"
  environment_id = "${var.environment_id}"
  description    = "${var.description}"
  value          = "${var.value}"
}
