###############################################################################
# Terraform Configuration
###############################################################################
###########################################################
# Version Configuration
###########################################################
terraform {
  required_version = ">= 1.8.0"

  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 2.8.2"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.3.0"
    }
  }
}

###########################################################
# Provider Configuration
###########################################################
provider "vsphere" {
  user                 = data.vault_kv_secret_v2.vcenter.data["admin_username"]
  password             = data.vault_kv_secret_v2.vcenter.data["admin_password"]
  vsphere_server       = data.vault_kv_secret_v2.vcenter.data["vcenter_hostname"]
  allow_unverified_ssl = var.vcenter_unverified_ssl
}

provider "vault" {
  address    = var.vault_server
  token_name = "Terraform"
  auth_login_token_file {
    filename = var.vault_token_path
  }
  skip_tls_verify = var.vault_unverified_ssl
}
