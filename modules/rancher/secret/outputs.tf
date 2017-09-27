output "id" {
  value = "${rancher_secret.secret.id}"
}

output "name" {
  value = "${rancher_secret.secret.name}"
}

output "description" {
  value = "${rancher_secret.secret.description}"
}
