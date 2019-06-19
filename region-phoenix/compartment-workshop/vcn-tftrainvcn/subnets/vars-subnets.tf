# --
variable "subnets" {
    type = "map"
    default = {
      DBClientSN = ""
      DBBackupSN = ""
      MgmtSN     = ""
    }
}

