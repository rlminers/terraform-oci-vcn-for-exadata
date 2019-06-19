# ######################################
# vm details
# ######################################

variable "AD" { default = "1" }
variable "privateIP" { default = "172.16.3.10" }
variable "subnet"    { default = "MgmtSN" }

variable "InstanceShape" { default = "VM.Standard2.1" }
variable "InstanceName"  { default = "tfPubVm" }
variable "image_id"      { default = "ol7_6" }
variable "root_size"     { default = "100" }

variable "BootStrapFile" { default = "./userdata/bootstrap" }

variable "BV1Name" { default = "tfPubVmBV1" }
variable "BV1Size" { default = "200" }

