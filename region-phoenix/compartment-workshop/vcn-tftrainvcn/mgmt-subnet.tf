# --
# ####################################################################
# -- Mgmt Subnet
# --
# --
# --
# ####################################################################

resource "oci_core_subnet" "MgmtSubnet" {
  cidr_block   = "${var.mgmt_subnet_cidr}"
  display_name = "${var.mgmt_subnet_name}"
  dns_label    = "${var.mgmt_subnet_name}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.VCN.id}"
  route_table_id    =  "${oci_core_route_table.MgmtRouteTableName.id}"
  security_list_ids = ["${oci_core_security_list.MgmtSecList.id}"]
  dhcp_options_id   =  "${oci_core_dhcp_options.MgmtDhcp.id}"
  prohibit_public_ip_on_vnic = "false"
}

