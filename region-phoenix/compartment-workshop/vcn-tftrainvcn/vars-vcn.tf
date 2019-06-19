# --
# ####################################################################
# -- Variables Used in VCN
# --
# --
# --
# ####################################################################

# ------------------------------------------------------------
# -- On-Prem info
# ------------------------------------------------------------
variable "on_prem_cidr" { default = "10.0.0.0/16" }
#
variable "public_cidr" { default = "0.0.0.0/0" }

# ------------------------------------------------------------
# -- VCN
# ------------------------------------------------------------
variable "tf_vcn_cidr"      { default = "172.16.0.0/16" }
variable "tf_vcn_name"      { default = "TFTrainVCN" }
# -- = lower_case(tf_vcn_name) + oraclevcn.com
variable "tf_search_domain" { default = "tftrainvcn.oraclevcn.com" }

# ------------------------------------------------------------
# -- Gateways
# ------------------------------------------------------------
# -- Internet Gateway
variable "tf_igw_name" { default = "TFTrainIGW" }
# -- NAT Gateway
variable "tf_ngw_name" { default = "TFTrainNGW" }
# -- Service Gateway
variable "tf_sgw_name" { default = "TFTrainSGW" }
# -- Dynamic Routing Gateway
variable "tf_drg_name" { default = "TFTrainDRG" }

# ------------------------------------------------------------
# -- Subnets
# ------------------------------------------------------------
#
# -- DB Client Subnet
variable "db_client_subnet_name"      { default = "DbClientSN" }
variable "db_client_subnet_cidr"      { default = "172.16.1.0/24" }
variable "db_client_dhcp_name"        { default = "DbClientDhcp" }
variable "db_client_route_table_name" { default = "DbClientRouteTable" }
variable "db_client_seclist_name"     { default = "DbClientSecList" }
#
# -- DB Backup Subnet
variable "db_backup_subnet_name"      { default = "DbBackupSN" }
variable "db_backup_subnet_cidr"      { default = "172.16.2.0/24" }
variable "db_backup_dhcp_name"        { default = "DbBackupDhcp" }
variable "db_backup_route_table_name" { default = "DbBackupRouteTable" }
variable "db_backup_seclist_name"     { default = "DbBackupSecList" }
#
# -- Mgmt Subnet
variable "mgmt_subnet_name"      { default = "MgmtSN" }
variable "mgmt_subnet_cidr"      { default = "172.16.3.0/24" }
variable "mgmt_dhcp_name"        { default = "MgmtDhcp" }
variable "mgmt_route_table_name" { default = "MgmtRouteTable" }
variable "mgmt_seclist_name"     { default = "MgmtSecList" }

