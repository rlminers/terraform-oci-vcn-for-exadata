# --
# ####################################################################
# -- DB Client Subnet
# --
# --
# --
# ####################################################################

resource "oci_core_subnet" "DbClientSubnet" {
  cidr_block   = "${var.db_client_subnet_cidr}"
  display_name = "${var.db_client_subnet_name}"
  dns_label    = "${var.db_client_subnet_name}"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.VCN.id}"
  route_table_id    =  "${oci_core_route_table.DbClientRouteTableName.id}"
  security_list_ids = ["${oci_core_security_list.DbClientSecList.id}"]
  dhcp_options_id   =  "${oci_core_dhcp_options.DbClientDhcp.id}"
  prohibit_public_ip_on_vnic = "true"
}


# // A regional subnet will not specify an Availability Domain
#resource "oci_core_subnet" "DbClientSubnet" {
#  cidr_block        = "${var.db_client_cidr}"
#  display_name      = "TFRegionalSubnet"
#  dns_label         = "regionalsubnet"
#  compartment_id    = "${var.compartment_ocid}"
#  vcn_id            = "${oci_core_virtual_network.vcn1.id}"
#  security_list_ids = ["${oci_core_virtual_network.vcn1.default_security_list_id}"]
#  route_table_id    = "${oci_core_virtual_network.vcn1.default_route_table_id}"
#  dhcp_options_id   = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
#}

# // An AD based subnet will supply an Availability Domain
#resource "oci_core_subnet" "subnet2" {
#  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
#  cidr_block          = "10.0.2.0/24"
#  display_name        = "TFADSubnet"
#  dns_label           = "adsubnet"
#  compartment_id      = "${var.compartment_ocid}"
#  vcn_id              = "${oci_core_virtual_network.vcn1.id}"
#  security_list_ids   = ["${oci_core_virtual_network.vcn1.default_security_list_id}"]
#  route_table_id      = "${oci_core_virtual_network.vcn1.default_route_table_id}"
#  dhcp_options_id     = "${oci_core_virtual_network.vcn1.default_dhcp_options_id}"
#}

#  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"

