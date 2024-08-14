###############################################################################
# Primary Terraform Configuration
# 
# WARNING: MAINTAIN THIS AS A SEPARATE STATE TO REDUCE LIKELIHOOD OF DESTRUCTION OF CORE INFRASTRUCTURE!!!!!!
#
# This will baselinet the vCenter Configuration for the Enclave.
###############################################################################
###########################################################
# Datacenter
# Import: An existing datacenter can be imported into this resource via
# supplying the full path to the datacenter:
# 
# terraform import vsphere_datacenter.dc /dc1
###########################################################
resource "vsphere_datacenter" "kbsc" {
  name = var.datacenter

  # Add Tag After Import
  tags = [
    vsphere_tag.unclass.id,
    vsphere_tag.caveat_none.id
  ]
}

###########################################################
# Compute Cluster
# Import: An existing cluster can be imported into this resource via the path
# to the cluster, via the following command:
# 
# terraform import vsphere_compute_cluster.compute_cluster /dc-01/host/cluster-01
###########################################################
#######################################
# This is currently just a READ-ONLY lookup because I was being lazy and didn't
# want to configure the cluster resource here; which gets hairy with the hosts.
# Change to a "resource" to manage the Cluster configuration here. You will also
# configure the vSAN here, which also seems "painful" for now...
#######################################
data "vsphere_compute_cluster" "ceis" {
  name          = var.cluster
  datacenter_id = vsphere_datacenter.kbsc.moid
}

###########################################################
# Hosts
# Import: An existing host can be imported into this resource by supplying the
# host's ID:
#
# terraform import vsphere_host.esx-01 host-123
###########################################################
