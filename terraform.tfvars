###############################################################################
# Terraform Values
###############################################################################
###########################################################
# Vault Variables
###########################################################
vault_server              = "https://vault.kten.test"
vault_token_path          = "/home/aackerman/.vault-cluster-token"
vault_unverified_ssl      = false
kv2_sysad_engine_mount    = "SysAd"
vcenter_secrets_path      = "VMware"
vault_license_secret_path = "Licenses"

###########################################################
# VMware vCenter Variables
###########################################################
vcenter_unverified_ssl = true
datacenter             = "KBSC_Main"
datastore              = "KTEN-Datastore"
cluster                = "TestCluster"
folder                 = "TestRange"
domain                 = "kten.test"

