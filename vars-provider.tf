# --
# ####################################################################
# -- Provider File
# --
# -- variables required for authentication to use Terraform API
# --
# ####################################################################

provider "oci" {
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region           = "${var.region}"
}

