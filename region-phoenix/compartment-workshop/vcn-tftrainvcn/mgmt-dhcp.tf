# --
# ####################################################################
# -- DHCP Options
# --
# -- Used by the Mgmt Subnet
# -- 
# ####################################################################

resource "oci_core_dhcp_options" "MgmtDhcp" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
  display_name   = "${var.mgmt_dhcp_name}"

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

