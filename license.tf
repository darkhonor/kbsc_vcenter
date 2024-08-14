###############################################################################
# KTEN License Configuration
#
# This will add licenses to the vCenter inventory that can then be applied
# to the various hosts. Create a license entry for each vCenter, vSAN, or 
# ESXi license that we have assigned (even if the ESXi license supports a
# number of CPUs)
#
# Recommend storing these in Vault to keep them secure and just provide via
# reference for the value similar to how login credentials to vCenter are
# provided. An example reference is shown in the first example.
#
###############################################################################
resource "vsphere_license" "vcenter" {
  license_key = data.vault_kv_secret_v2.licenses.data["vCenter8-Standard"]
}

resource "vsphere_license" "vsan" {
  license_key = data.vault_kv_secret_v2.licenses.data["vSAN8-Enterprise"]
}

resource "vsphere_license" "esxi7" {
  license_key = data.vault_kv_secret_v2.licenses.data["vSphere7-Desktop"]
  labels = {
    "License" = "vSphere7-Desktop"
    "source" = "Terraform"
  }
}

resource "vsphere_license" "esxi8" {
  license_key = data.vault_kv_secret_v2.licenses.data["vSphere8-Desktop-300vms"]
}