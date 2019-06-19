# --
# ####################################################################
# -- Security list
# --
# -- Used by the DB Client Subnet
# --
# -- 1  = ICMP
# -- 6  = TCP
# -- 17 = UCP
# --
# ####################################################################

# https://docs.cloud.oracle.com/iaas/Content/Database/Tasks/exanetwork.htm#client_sec_list

resource "oci_core_security_list" "MgmtSecList" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.mgmt_seclist_name}"
    vcn_id = "${oci_core_virtual_network.VCN.id}"
# ------------------------------------------------------------
# ------------------------------------------------------------
    egress_security_rules = [
# ------------------------------------------------------------
# ------------------------------------------------------------

# Egress rule 1: Allows all TCP traffic inside the client subnet
    {
        protocol = "6"
        destination = "${var.mgmt_subnet_cidr}"
    },

# Egress rule 2: Allows all ICMP traffic inside the client subnet
    {
        protocol = "1"
        destination = "${var.mgmt_subnet_cidr}"
    },

# Egress rule 3: Allows all egress traffic
    {
        protocol = "6"
        destination = "0.0.0.0/0"
    },

# ICMP traffic
    {
        protocol = "17"
        destination = "${var.mgmt_subnet_cidr}"
    },
  ]
# ------------------------------------------------------------
# ------------------------------------------------------------
    ingress_security_rules = [
# ------------------------------------------------------------
# ------------------------------------------------------------
#
# SSH traffic
    {
        tcp_options {
            "max" = 22
            "min" = 22
        }
        protocol = "6"
        source = "${var.public_cidr}"
    },

# RDP traffic
    {
        tcp_options {
            "max" = 389
            "min" = 389
        }
        protocol = "6"
        source = "${var.public_cidr}"
    },

# Database traffic
    {
        tcp_options {
            "max" = 22
            "min" = 22
        }
        protocol = "6"
        source = "${var.db_client_subnet_cidr}"
    },

    {
        tcp_options {
            "max" = 80
            "min" = 80
        }
        protocol = "6"
        source = "${var.public_cidr}"
    },

  ]
}

