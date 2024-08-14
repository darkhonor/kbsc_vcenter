###############################################################################
# Vault Resources
###############################################################################
###########################################################
# Key-Value Secret References
###########################################################
data "vault_kv_secret_v2" "vcenter" {
  mount = var.kv2_sysad_engine_mount
  name  = var.vcenter_secrets_path
}

data "vault_kv_secret_v2" "licenses" {
  mount = var.kv2_sysad_engine_mount
  name  = var.vault_license_secret_path
}