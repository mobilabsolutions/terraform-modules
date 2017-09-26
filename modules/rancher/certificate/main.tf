resource "rancher_certificate" "certificate" {
  name           = "${var.name}-cert"
  environment_id = "${var.environment_id}"
  cert           = "${var.ssl_public}"
  cert_chain     = "${var.ssl_chain}"
  key            = "${var.ssl_private}"
}
