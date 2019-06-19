# --
# ####################################################################
# -- Route Table
# --
# -- Used by the DB Client Subnet
# --
# ####################################################################

resource "oci_core_route_table" "DbClientRouteTableName" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
  display_name   = "${var.db_client_route_table_name}"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = "${oci_core_nat_gateway.NGW.id}"
  }

#  route_rules {
#    destination       = "${var.mgmt_subnet_cidr}"
#    network_entity_id = "${oci_core_drg.DRG.id}"
#  }

  route_rules {
    destination       = "${lookup(data.oci_core_services.all_services.services[0], "cidr_block")}"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = "${oci_core_service_gateway.SGW.id}"
  }

}

