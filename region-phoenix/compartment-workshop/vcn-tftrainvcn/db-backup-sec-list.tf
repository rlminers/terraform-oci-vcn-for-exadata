# --
# ####################################################################
# -- Security list
# --
# -- Used by the DB Backup Subnet
# --
# -- 1  = ICMP
# -- 6  = TCP
# -- 17 = UCP
# --
# ####################################################################

# https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/exanetwork.htm#backup_sec_list

resource "oci_core_security_list" "DbBackupSecList" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.db_backup_seclist_name}"
    vcn_id = "${oci_core_virtual_network.VCN.id}"
# ------------------------------------------------------------
# ------------------------------------------------------------
    egress_security_rules = [
# ------------------------------------------------------------
# ------------------------------------------------------------
    {
        protocol = "6"
        destination = "${var.db_backup_subnet_cidr}"
    },

# Egress rule: Allows access to Object Storage
    {
        tcp_options {
            "max" = 443
            "min" = 443
        }
        protocol = "6"
        destination = "${lookup(data.oci_core_services.obj_services.services[0], "cidr_block")}"
         destination_type  = "SERVICE_CIDR_BLOCK"
    }
  ]
#
# ------------------------------------------------------------
# ------------------------------------------------------------
    ingress_security_rules = [
# ------------------------------------------------------------
# ------------------------------------------------------------
    {
        protocol = "6"
        source = "${var.db_backup_subnet_cidr}"
    },

    {
        protocol = "1"
        source = "${var.db_backup_subnet_cidr}"
    }
  ]
}

