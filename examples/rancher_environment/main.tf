provider "rancher" {
  api_url    = "${var.rancher_api_url}"
  access_key = "${var.rancher_access_key}"
  secret_key = "${var.rancher_secret_key}"
}

module rancher_environment {
  source                      = "git::ssh://git@github.com/mobilabsolutions/terraform-modules.git?ref=master//modules/rancher/environment"
  name                        = "${var.name}"
  registry_address            = "${var.registry_address}"
  registry_email              = "${var.registry_email}"
  registry_credential_public  = "${var.registry_credential_public}"
  registry_credential_private = "${var.registry_credential_private}"
}

output environment_id {
  value = "${module.rancher_environment.id}"
}
