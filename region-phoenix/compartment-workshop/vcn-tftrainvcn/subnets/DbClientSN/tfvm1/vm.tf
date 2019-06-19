# --
resource "oci_core_instance" "VM" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.InstanceName}"
  shape               = "${var.InstanceShape}"

  create_vnic_details {
    subnet_id        = "${var.subnets[var.subnet]}"
    display_name     = "primaryvnic"
    assign_public_ip = false
    hostname_label   = "${var.InstanceName}"
    private_ip       = "${var.privateIP}"
  },

  source_details {
    source_type             = "image"
    source_id               = "${var.OL7Image[var.image_id]}"
    boot_volume_size_in_gbs = "${var.root_size}"
  }

  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data           = "${base64encode(file(var.BootStrapFile))}"
  }

  timeouts {
    create = "60m"
  }
}

