resource "azurerm_storage_container" "osdisk" {
  count                 = "${var.count}"
  name                  = "${var.name}-${format(var.count_format, var.count_offset + count.index + 1)}"
  storage_account_name  = "${var.storage_account_name}"
  resource_group_name   = "${var.resource_group_name}"
  container_access_type = "private"
}

resource "azurerm_virtual_machine" "vm" {
  count                 = "${var.count}"
  name                  = "${var.name}-vm-${format(var.count_format, var.count_offset + count.index + 1)}"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group_name}"
  vm_size               = "${var.vm_size}"
  network_interface_ids = ["${element(var.network_interface_ids, count.index)}"]
  availability_set_id   = "${var.availability_set_id}"

  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }

  storage_os_disk {
    name          = "${var.name}-${format(var.count_format, var.count_offset + count.index + 1)}"
    vhd_uri       = "${var.storage_primary_blob_endpoint}${element(azurerm_storage_container.osdisk.*.name, count.index)}/${var.os_disk_name}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "${var.name}-${format(var.count_format, var.count_offset+count.index+1)}"
    admin_username = "${var.admin_username}"
    custom_data    = "${length(var.cloud_init_rendered) == "1" ? element(var.cloud_init_rendered, 1) : element(var.cloud_init_rendered, count.index)}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
      key_data = "${var.public_key}"
    }
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = "${var.storage_primary_blob_endpoint}"
  }

  tags = "${merge(var.tags, map("resourceType", "vm"))}"
}
