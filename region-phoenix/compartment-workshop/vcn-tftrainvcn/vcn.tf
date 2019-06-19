# --
# ####################################################################
# -- VCN Components
# --
# -- This is the TF Training VCN
# --
# ####################################################################

# ------------------------------------------------------------
# -- VCN
# ------------------------------------------------------------
resource "oci_core_virtual_network" "VCN" {
  cidr_block     = "${var.tf_vcn_cidr}"
  dns_label      = "${var.tf_vcn_name}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.tf_vcn_name}"
}

# ------------------------------------------------------------
# -- Internet Gateway
# -- IGW
# ------------------------------------------------------------
resource "oci_core_internet_gateway" "IGW" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.tf_igw_name}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
}

# ------------------------------------------------------------
# -- NAT Gateway
# -- NGW
# ------------------------------------------------------------
resource "oci_core_nat_gateway" "NGW" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.tf_ngw_name}"
  vcn_id         = "${oci_core_virtual_network.VCN.id}"
}

# ------------------------------------------------------------
# -- Service Gateway
# -- SGW
# ------------------------------------------------------------
resource "oci_core_service_gateway" "SGW" {
  #Required
  compartment_id = "${var.compartment_ocid}"

  services {
    service_id = "${lookup(data.oci_core_services.all_services.services[0], "id")}"
  }

  vcn_id = "${oci_core_virtual_network.VCN.id}"

  #Optional
  display_name = "${var.tf_sgw_name}"
}

# ------------------------------------------------------------
# -- DRG - Dynamic Routing Gateway
# ------------------------------------------------------------
resource "oci_core_drg" "DRG" {
  compartment_id = "${var.compartment_ocid}"
}

