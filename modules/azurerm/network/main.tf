resource "azurerm_virtual_network" "vn" {
  name                = "${var.name}-vn"
  resource_group_name = "${var.resource_group_name}"
  address_space       = ["${split(",",var.address_space)}"]
  location            = "${var.location}"

  tags = "${merge(var.virtual_network_tags, map("resourceType", "vn"))}"
}

resource "azurerm_subnet" "sb" {
  count                = "${length(keys(var.subnets))}"
  name                 = "${element(keys(var.subnets), count.index)}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.vn.name}"
  address_prefix       = "${lookup(var.subnets, element(keys(var.subnets), count.index))}"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}-nsg"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"

  tags = "${merge(var.security_group_tags, map("resourceType", "nsg"))}"
}

resource "azurerm_network_security_rule" "nsr" {
  count                       = "${length(var.rule_list)}"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"

  name                       = "${element(split(",", element(var.rule_list, count.index)), 0)}"
  priority                   = "${element(split(",", element(var.rule_list, count.index)), 1)}"
  direction                  = "${element(split(",", element(var.rule_list, count.index)), 2)}"
  access                     = "${element(split(",", element(var.rule_list, count.index)), 3)}"
  protocol                   = "${element(split(",", element(var.rule_list, count.index)), 4)}"
  source_port_range          = "${element(split(",", element(var.rule_list, count.index)), 5)}"
  destination_port_range     = "${element(split(",", element(var.rule_list, count.index)), 6)}"
  source_address_prefix      = "${element(split(",", element(var.rule_list, count.index)), 7)}"
  destination_address_prefix = "${element(split(",", element(var.rule_list, count.index)), 8)}"
}

resource "azurerm_public_ip" "pi" {
  count = "${var.network_interface_count}"

  # Resource location
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  # Public IP Information
  name                         = "${lower(var.name)}-ip-vm-${format(var.network_interface_count_format, var.network_interface_count_offset + count.index + 1)}"
  domain_name_label            = "${lower(var.name)}-${format(var.network_interface_count_format, var.network_interface_count_offset + count.index + 1)}"
  public_ip_address_allocation = "dynamic"

  tags = "${merge(var.public_ip_tags, map("resourceType", "pi"))}"
}

# All VMs require a network interface
resource "azurerm_network_interface" "ni" {
  count = "${var.network_interface_count}"

  # Resource location
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  # NIC Name Information
  name                      = "${var.name}-ni-vm-${format(var.network_interface_count_format, var.network_interface_count_offset + count.index + 1)}"
  internal_dns_name_label   = "${var.name}-${format(var.network_interface_count_format, var.network_interface_count_offset + count.index + 1)}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"

  ip_configuration {
    name                                    = "${var.name}-${format(var.network_interface_count_format, var.network_interface_count_offset + count.index + 1)}"
    subnet_id                               = "${element("${azurerm_subnet.sb.*.id}", count.index)}"
    private_ip_address_allocation           = "dynamic"
    public_ip_address_id                    = "${element(azurerm_public_ip.pi.*.id, count.index)}"
    load_balancer_backend_address_pools_ids = ["${compact(var.lb_pool_ids)}"]
  }

  tags = "${merge(var.network_interface_tags, map("resourceType", "ni"))}"
}
