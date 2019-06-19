# ######################################
# vm details
# ######################################

variable "AD" { default = "1" }
variable "privateIP" { default = "172.16.1.10" }
variable "subnet"    { default = "DBClientSN" }

variable "InstanceShape" { default = "VM.Standard2.1" }
variable "InstanceName"  { default = "tfvm1" }
variable "image_id"      { default = "ol7_6" }
variable "root_size"     { default = "100" }

variable "BootStrapFile" { default = "./userdata/bootstrap" }

variable "BV1Name" { default = "tfvm1BV1" }
variable "BV1Size" { default = "200" }

