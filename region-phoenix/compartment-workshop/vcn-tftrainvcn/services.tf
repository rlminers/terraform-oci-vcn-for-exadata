# --
# ####################################################################
# -- Services
# --
# -- These are used with Service Gateways
# -- and are used in routes tables and security lists
# ####################################################################

# -- used in route tables
data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

#output "all_services" {
#  value = ["${data.oci_core_services.all_services.services}"]
#}

# -- used in security lists
data "oci_core_services" "obj_services" {
  filter {
    name   = "name"
    values = ["OCI .* Object Storage"]
    regex  = true
  }
}

#output "obj_services" {
#  value = ["${data.oci_core_services.obj_services.services}"]
#}

