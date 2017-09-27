resource "rancher_host" "host" {
  count = "${var.count}"

  name           = "${var.name}-vm-${format(var.count_format, var.count_offset + count.index + 1)}"
  environment_id = "${var.environment_id}"
  hostname       = "${element(var.hostname_list, count.index)}"
}
