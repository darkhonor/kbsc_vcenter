###############################################################################
# vCenter Folders
###############################################################################
resource "vsphere_folder" "security" {
  path          = "Security"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.production.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cnd.id
  ]
}

resource "vsphere_folder" "servers" {
  path          = "Servers"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.ceis.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.sysad.id
  ]
}

resource "vsphere_folder" "templates" {
  path          = "Templates"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.production.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.sysad.id
  ]
}

resource "vsphere_folder" "test" {
  path          = "TestRange"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id
  ]
}

resource "vsphere_folder" "vcenter" {
  path          = "vCenter"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.production.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.sysad.id
  ]
}

resource "vsphere_folder" "kubernetes" {
  path          = "Kubernetes"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cio.id
  ]
}

resource "vsphere_folder" "kubernetes_rancher" {
  path          = "Kubernetes/Rancher"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cio.id
  ]
}

resource "vsphere_folder" "kubernetes_prod" {
  path          = "Kubernetes/Production"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cio.id
  ]
}

resource "vsphere_folder" "kubernetes_test" {
  path          = "Kubernetes/Test"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cio.id
  ]
}

resource "vsphere_folder" "devops" {
  path          = "DevOps"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.production.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.cio.id
  ]
}

resource "vsphere_folder" "horizon" {
  path          = "Horizon"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.ceis.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.sysad.id
  ]
}

resource "vsphere_folder" "horizon_desk" {
  path          = "Horizon Desktops"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.ceis.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_cui.id,
    vsphere_tag.sysad.id
  ]
}

resource "vsphere_folder" "demo" {
  path          = "Demo"
  type          = "vm"
  datacenter_id = vsphere_datacenter.kbsc.moid

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_none.id,
    vsphere_tag.sysad.id
  ]
}