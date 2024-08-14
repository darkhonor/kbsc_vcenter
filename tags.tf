###############################################################################
# Tags Assigned to the enclave's VMware Infrastructure
###############################################################################
resource "vsphere_tag_category" "test" {
  name        = "terraform-test-category"
  cardinality = "SINGLE"
  description = "System Under Test (SUT) Virtual Machines"

  associable_types = [
    "Folder",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag_category" "prod" {
  name        = "terraform-prod-category"
  cardinality = "MULTIPLE"
  description = "Production Virtual Machines"

  associable_types = [
    "Folder",
    "ClusterComputeResource",
    "com.vmware.content.Library",
    "com.vmware.content.library.Item",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag_category" "classification" {
  name        = "CLASSIFICATION"
  cardinality = "SINGLE"
  description = "USG Classification of the Asset"

  associable_types = [
    "Folder",
    "ClusterComputeResource",
    "Datacenter",
    "Datastore",
    "StoragePod",
    "DistributedVirtualPortgroup",
    "DistributedVirtualSwitch",
    "VmwareDistributedVirtualSwitch",
    "HostSystem",
    "com.vmware.content.Library",
    "com.vmware.content.library.Item",
    "HostNetwork",
    "Network",
    "OpaqueNetwork",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag_category" "caveat" {
  name        = "CLASSIFICATION_CAVEAT"
  cardinality = "MULTIPLE"
  description = "USG Classification Caveats for the Asset"

  associable_types = [
    "Folder",
    "ClusterComputeResource",
    "Datacenter",
    "Datastore",
    "StoragePod",
    "DistributedVirtualPortgroup",
    "DistributedVirtualSwitch",
    "VmwareDistributedVirtualSwitch",
    "HostSystem",
    "com.vmware.content.Library",
    "com.vmware.content.library.Item",
    "HostNetwork",
    "Network",
    "OpaqueNetwork",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "test_tag" {
  name        = "Test"
  category_id = vsphere_tag_category.test.id
  description = "System Under Test"
}

resource "vsphere_tag" "production" {
  name        = "Production"
  category_id = vsphere_tag_category.prod.id
  description = "Production System"
}

resource "vsphere_tag" "ceis" {
  name        = "CEIS"
  category_id = vsphere_tag_category.prod.id
  description = "CEIS System"
}

resource "vsphere_tag" "dc" {
  name        = "DomainController"
  category_id = vsphere_tag_category.prod.id
  description = "Domain Controller"
}

resource "vsphere_tag" "unclass" {
  name        = "UNCLASSIFIED"
  category_id = vsphere_tag_category.classification.id
  description = "UNCLASSIFIED"
}

resource "vsphere_tag" "secret" {
  name        = "SECRET"
  category_id = vsphere_tag_category.classification.id
  description = "SECRET"
}

resource "vsphere_tag" "caveat_none" {
  name        = "NONE"
  category_id = vsphere_tag_category.caveat.id
  description = "No Classification Caveats"
}

resource "vsphere_tag" "caveat_cui" {
  name        = "CUI"
  category_id = vsphere_tag_category.caveat.id
  description = "Controlled Unclassified Information"
}

resource "vsphere_tag" "caveat_pii" {
  name        = "PII"
  category_id = vsphere_tag_category.caveat.id
  description = "Personnally Identifiable Information"
}

resource "vsphere_tag" "caveat_rel_kor" {
  name        = "REL USA, KOR"
  category_id = vsphere_tag_category.caveat.id
  description = "REL USA, KOR"
}

resource "vsphere_tag_category" "opr" {
  name        = "OPR"
  cardinality = "SINGLE"
  description = "Office of Primary Responsibility"

  associable_types = [
    "Folder",
    "ClusterComputeResource",
    "com.vmware.content.Library",
    "com.vmware.content.library.Item",
    "ResourcePool",
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "cio" {
  name        = "CIO"
  category_id = vsphere_tag_category.opr.id
  description = "KBSC CIO"
}

resource "vsphere_tag" "sysad" {
  name        = "SYSAD"
  category_id = vsphere_tag_category.opr.id
  description = "KBSC System Administrators"
}

resource "vsphere_tag" "cnd" {
  name        = "CND"
  category_id = vsphere_tag_category.opr.id
  description = "KBSC Cyber Network Defense Team"
}

resource "vsphere_tag_category" "kubernetes_role" {
  name        = "K8S ROLE"
  cardinality = "SINGLE"
  description = "Kubernetes Node Role"

  associable_types = [
    "VirtualApp",
    "VirtualMachine"
  ]
}

resource "vsphere_tag" "controller" {
  name        = "Controller"
  category_id = vsphere_tag_category.kubernetes_role.id
}

resource "vsphere_tag" "worker" {
  name        = "Worker"
  category_id = vsphere_tag_category.kubernetes_role.id
}