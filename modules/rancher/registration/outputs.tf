output "command" {
  value = "${rancher_registration_token.token.command}"
}

output "registration_url" {
  value = "${rancher_registration_token.token.registration_url}"
}
