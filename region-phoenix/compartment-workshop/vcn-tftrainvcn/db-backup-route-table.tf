# --
# ####################################################################
# -- Route Table
# --
# -- Used by the DB Backup Subnet
# --
# ####################################################################

resource "oci_core_route_table" "DbBackupRouteTableName" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
  display_name   = "${var.db_backup_route_table_name}"

  route_rules {
    destination       = "${lookup(data.oci_core_services.all_services.services[0], "cidr_block")}"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = "${oci_core_service_gateway.SGW.id}"
  }

}

