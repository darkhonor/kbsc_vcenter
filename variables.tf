###############################################################################
# Terraform Variable Definitions
###############################################################################
###########################################################
# Vault Variables
###########################################################
variable "vault_server" {
  description = "URL for the HashiCorp Vault Server"
  type        = string
}

variable "vault_token_path" {
  description = "Filename containing a Vault Token"
  type        = string
}

variable "vault_unverified_ssl" {
  description = "Whether you are going to allow unverified SSL certificates"
  type        = bool
}

variable "kv2_sysad_engine_mount" {
  description = "Path to the System Administrator KV V2 secrets engine"
  type        = string
}

variable "vcenter_secrets_path" {
  description = "Path to the vCenter secrets in the Vault Server"
  type        = string
}

variable "vault_license_secret_path" {
  description = "Path to the Licenses secret in the Vault Server"
  type        = string
}

###########################################################
# VMware vCenter Variables
###########################################################
variable "vcenter_unverified_ssl" {
  description = "Whether you are going to allow unverified SSL certificates"
  type        = bool
}

variable "datacenter" {
  description = "vCenter Datacenter"
  type        = string
}

variable "datastore" {
  description = "vCenter Datastore"
  type        = string
}

variable "cluster" {
  description = "vCenter Cluster"
  type        = string
}

variable "folder" {
  description = "vCenter Folder"
  type        = string
}

variable "domain" {
  description = "DNS Domain Name for the system"
  type        = string
}
