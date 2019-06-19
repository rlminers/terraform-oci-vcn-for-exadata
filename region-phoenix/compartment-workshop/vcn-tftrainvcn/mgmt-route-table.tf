# --
# ####################################################################
# -- Route Table
# --
# -- Used by the Mgmt Subnet
# --
# ####################################################################

resource "oci_core_route_table" "MgmtRouteTableName" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
  display_name   = "${var.mgmt_route_table_name}"

  route_rules {
    destination        = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.IGW.id}"
  }

}

