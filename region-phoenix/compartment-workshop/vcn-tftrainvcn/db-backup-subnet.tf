# --
# ####################################################################
# -- DB Backup Subnet
# --
# -- 
# --
# ####################################################################

resource "oci_core_subnet" "DbBackupSubnet" {
  cidr_block   = "${var.db_backup_subnet_cidr}"
  display_name = "${var.db_backup_subnet_name}"
  dns_label    = "${var.db_backup_subnet_name}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.VCN.id}"
  route_table_id    =  "${oci_core_route_table.DbBackupRouteTableName.id}"
  security_list_ids = ["${oci_core_security_list.DbBackupSecList.id}"]
  dhcp_options_id   =  "${oci_core_dhcp_options.DbBackupDhcp.id}"
  prohibit_public_ip_on_vnic = "true"
}

