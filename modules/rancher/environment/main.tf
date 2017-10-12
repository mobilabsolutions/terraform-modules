resource "rancher_environment" "env" {
  name          = "${var.name}"
  orchestration = "${var.orchestration}"
  description   = "${var.description}"
}
