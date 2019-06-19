# --
# ####################################################################
# -- DHCP Options
# --
# -- Used by the DB Client Subnet
# --
# ####################################################################

resource "oci_core_dhcp_options" "DbClientDhcp" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
  display_name   = "${var.db_client_dhcp_name}"

  // required
  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type                = "SearchDomain"
    search_domain_names = ["${var.tf_search_domain}"]
  }
}

