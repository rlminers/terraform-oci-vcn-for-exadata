# --
resource "oci_core_volume" "BV1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.BV1Name}"
  size_in_gbs         = "${var.BV1Size}"
}

resource "oci_core_volume_attachment" "BV1ATTACH" {
    attachment_type = "iscsi"
    compartment_id  = "${var.compartment_ocid}"
    instance_id     = "${oci_core_instance.VM.id}"
    volume_id       = "${oci_core_volume.BV1.id}"
}

