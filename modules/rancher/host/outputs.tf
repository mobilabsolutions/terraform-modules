output "ids" {
  value = "${rancher_host.host.*.id}"
}
