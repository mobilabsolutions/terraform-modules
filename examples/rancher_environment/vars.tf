variable rancher_api_url {
  description = "(Required) Rancher API url."
}

variable rancher_access_key {
  description = "(Optional) Rancher API access key."
}

variable rancher_secret_key {
  description = "(Optional) Rancher API access key."
}

variable name {
  type        = "string"
  description = "(Required) The name of the environment."
}

variable registry_address {
  type = "string"
}

variable registry_email {
  type = "string"
}

variable registry_credential_public {
  type = "string"
}

variable registry_credential_private {
  type = "string"
}