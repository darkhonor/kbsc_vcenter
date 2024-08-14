###############################################################################
# KTEN Resource Pools Configuration
###############################################################################
###########################################################
# Kubernetes Resource Pool and Child Pools
###########################################################
resource "vsphere_resource_pool" "kubernetes" {
  name                    = "Kubernetes"
  parent_resource_pool_id = data.vsphere_compute_cluster.ceis.resource_pool_id
}

#######################################
# Rancher Cluster Pool
#######################################
resource "vsphere_resource_pool" "kubernetes_rancher" {
  name                    = "Rancher"
  parent_resource_pool_id = vsphere_resource_pool.kubernetes.id
}

#######################################
# Production Kubernetes Cluster Pool
#######################################
resource "vsphere_resource_pool" "kubernetes_prod" {
  name                    = "Production"
  parent_resource_pool_id = vsphere_resource_pool.kubernetes.id
}

#######################################
# Test Kubernetes Cluster Pool
#######################################
resource "vsphere_resource_pool" "kubernetes_test" {
  name                    = "Test"
  parent_resource_pool_id = vsphere_resource_pool.kubernetes.id

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_none.id,
    vsphere_tag.sysad.id
  ]
}

#######################################
# Demonstration Resource Pool
#######################################
resource "vsphere_resource_pool" "demo" {
  name                    = "Demo"
  parent_resource_pool_id = data.vsphere_compute_cluster.ceis.resource_pool_id

  tags = [
    vsphere_tag.test_tag.id,
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_none.id,
    vsphere_tag.sysad.id
  ]
}
