###############################################################################
# Enclave vCenter Role Definitions
#
# This file defines all of the enclave's unique account roles that need to be
# generated in order to support applications that interact with vCenter.
# Examples include Horizon, Rancher, and others. The configuration is kept here
# in order to allow recreation of all of the vCenter roles in the event of a DR
# incident.
#
# VMware Docs Reference of API Permissions:
# https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.security.doc/GUID-ED56F3C4-77D0-49E3-88B6-B99B8B437B62.html
# https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-security/GUID-ED56F3C4-77D0-49E3-88B6-B99B8B437B62.html
###############################################################################
###########################################################
# An existing role can be imported into this resource 
# by supplying the role id:
#
# terraform import vsphere_role.role1 -709298051 
###########################################################
###########################################################
# System Role reference required to assign local Admins
###########################################################
data "vsphere_role" "admin" {
  label = "Administrator"
}

###########################################################
# Enclave Custom Roles
###########################################################
#######################################
# Horizon role for Omnissa Horizon VDI.
# To support instant clones, the vCenter Server user must have privileges in
# addition to those required to support VMware Horizon 8.
# Reference:
# https://docs.omnissa.com/bundle/Horizon8InstallUpgrade/page/PrivilegesRequiredforthevCenterServerUserWithInstantClones.html
#######################################
resource "vsphere_role" "horizon" {
  name = "Horizon"
  role_privileges = [
    "Alarm.ToggleEnableOnEntity",
    # The following privileges are required if you use instant clones VMs with
    # a Trusted Platform Module (vTPM) device.
    "Cryptographer.Clone",
    "Cryptographer.Decrypt",
    "Cryptographer.Access",
    "Cryptographer.Encrypt",
    "Cryptographer.ManageKeyServers",
    "Cryptographer.Migrate",
    "Cryptographer.RegisterHost",
    # End vTPM Privs
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Folder.Create",
    "Folder.Delete",
    "Global.VCServer",
    "Global.DisableMethods",
    "Global.EnableMethods",
    "Global.ManageCustomFields",
    "Global.SetCustomField",
    "Host.Config.AdvancedConfig",
    "Host.Inventory.EditCluster",
    "Network.Assign",
    "StorageProfile.View",
    "StorageProfile.Update",
    "Resource.AssignVMToPool",
    "VirtualMachine.Config.DiskLease",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.AdvancedConfig",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.Resource",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Config.SwapPlacement",
    "VirtualMachine.Config.HostUSBDevice",
    "VirtualMachine.Config.ManagedBy",
    "VirtualMachine.Config.RawDevice",
    "VirtualMachine.Config.MksControl",
    "VirtualMachine.Config.DiskExtend",
    "VirtualMachine.Config.EditDevice",
    "VirtualMachine.Config.QueryFTCompatibility",
    "VirtualMachine.Config.QueryUnownedFiles",
    "VirtualMachine.Config.ReloadFromPath",
    "VirtualMachine.Config.RemoveDisk",
    "VirtualMachine.Config.Rename",
    "VirtualMachine.Config.ResetGuestInfo",
    "VirtualMachine.Config.Annotation",
    "VirtualMachine.Config.ChangeTracking",
    "VirtualMachine.Config.ToggleForkParent",
    "VirtualMachine.Config.UpgradeVirtualHardware",
    "VirtualMachine.Inventory.CreateFromExisting",
    "VirtualMachine.Inventory.Create",
    "VirtualMachine.Inventory.Move",
    "VirtualMachine.Inventory.Register",
    "VirtualMachine.Inventory.Delete",
    "VirtualMachine.Inventory.Unregister",
    "VirtualMachine.Interact.DeviceConnection",
    "VirtualMachine.Interact.SESparseMaintenance",
    "VirtualMachine.Interact.PowerOff",
    "VirtualMachine.Interact.PowerOn",
    "VirtualMachine.Interact.Reset",
    "VirtualMachine.Interact.Suspend",
    "VirtualMachine.Provisioning.DiskRandomAccess",
    "VirtualMachine.Provisioning.CloneTemplate",
    "VirtualMachine.Provisioning.Clone",
    "VirtualMachine.Provisioning.Customize",
    "VirtualMachine.Provisioning.DeployTemplate",
    "VirtualMachine.Provisioning.PromoteDisks",
    "VirtualMachine.Provisioning.ReadCustSpecs",
    "VirtualMachine.State.CreateSnapshot",
    "VirtualMachine.State.RemoveSnapshot",
    "VirtualMachine.State.RenameSnapshot",
    "VirtualMachine.State.RevertToSnapshot",
    "InventoryService.Tagging.AttachTag",
    "InventoryService.Tagging.ObjectAttachable",
    "InventoryService.Tagging.CreateTag",
    "InventoryService.Tagging.CreateCategory",
    "InventoryService.Tagging.DeleteTag",
    "InventoryService.Tagging.DeleteCategory"
  ]
}

#######################################
# Packer role for Building VM Templates
# Global permissions are required for the content library based on the
# hierarchical inheritance of permissions.
# Reference: 
# https://developer.hashicorp.com/packer/integrations/hashicorp/vsphere/latest/components/builder/vsphere-iso
#######################################
resource "vsphere_role" "packer" {
  name = "Packer"
  role_privileges = [
    "ContentLibrary.AddLibraryItem",
    "ContentLibrary.UpdateLibraryItem",
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.FileManagement",
    "Network.Assign",
    "Resource.AssignVMToPool",
    "VApp.Export",
    "VirtualMachine.Config.DiskLease",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.AdvancedConfig",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.Resource",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Config.SwapPlacement",
    "VirtualMachine.Config.HostUSBDevice",
    "VirtualMachine.Config.ManagedBy",
    "VirtualMachine.Config.RawDevice",
    "VirtualMachine.Config.MksControl",
    "VirtualMachine.Config.DiskExtend",
    "VirtualMachine.Config.EditDevice",
    "VirtualMachine.Config.QueryFTCompatibility",
    "VirtualMachine.Config.QueryUnownedFiles",
    "VirtualMachine.Config.ReloadFromPath",
    "VirtualMachine.Config.RemoveDisk",
    "VirtualMachine.Config.Rename",
    "VirtualMachine.Config.ResetGuestInfo",
    "VirtualMachine.Config.Annotation",
    "VirtualMachine.Config.ChangeTracking",
    "VirtualMachine.Config.ToggleForkParent",
    "VirtualMachine.Config.UpgradeVirtualHardware",
    "VirtualMachine.Inventory.CreateFromExisting",
    "VirtualMachine.Inventory.Create",
    "VirtualMachine.Inventory.Move",
    "VirtualMachine.Inventory.Register",
    "VirtualMachine.Inventory.Delete",
    "VirtualMachine.Inventory.Unregister",
    "VirtualMachine.Interact.DeviceConnection",
    "VirtualMachine.Interact.SESparseMaintenance",
    "VirtualMachine.Interact.PowerOff",
    "VirtualMachine.Interact.PowerOn",
    "VirtualMachine.Interact.Reset",
    "VirtualMachine.Interact.Suspend",
    "VirtualMachine.Provisioning.DiskRandomAccess",
    "VirtualMachine.Provisioning.CloneTemplate",
    "VirtualMachine.Provisioning.Clone",
    "VirtualMachine.Provisioning.Customize",
    "VirtualMachine.Provisioning.DeployTemplate",
    "VirtualMachine.Provisioning.PromoteDisks",
    "VirtualMachine.Provisioning.ReadCustSpecs",
    "VirtualMachine.State.CreateSnapshot",
    "InventoryService.Tagging.AttachTag",
    "InventoryService.Tagging.ObjectAttachable",
    "InventoryService.Tagging.CreateTag",
    "InventoryService.Tagging.CreateCategory",
    "InventoryService.Tagging.DeleteTag",
    "InventoryService.Tagging.DeleteCategory"
  ]
}

#######################################
# Rancher role for K8s Cluster Mgt
# Reference:
# https://ranchermanager.docs.rancher.com/how-to-guides/new-user-guides/launch-kubernetes-with-rancher/use-new-nodes-in-an-infra-provider/vsphere/create-credentials
#######################################
resource "vsphere_role" "rancher" {
  name = "Rancher"
  role_privileges = [
    "Cns.Searchable",
    "ContentLibrary.ReadStorage",
    "Cryptographer.Access",
    "Datastore.AllocateSpace",
    "Datastore.Browse",
    "Datastore.FileManagement",
    "Datastore.UpdateVirtualMachineFiles",
    "Datastore.UpdateVirtualMachineMetadata",
    "Global.SetCustomField",
    "Network.Assign",
    "Resource.AssignVMToPool",
    "VirtualMachine.Config.DiskLease",
    "VirtualMachine.Config.AddExistingDisk",
    "VirtualMachine.Config.AddNewDisk",
    "VirtualMachine.Config.AddRemoveDevice",
    "VirtualMachine.Config.AdvancedConfig",
    "VirtualMachine.Config.CPUCount",
    "VirtualMachine.Config.Memory",
    "VirtualMachine.Config.Resource",
    "VirtualMachine.Config.Settings",
    "VirtualMachine.Config.SwapPlacement",
    "VirtualMachine.Config.HostUSBDevice",
    "VirtualMachine.Config.ManagedBy",
    "VirtualMachine.Config.RawDevice",
    "VirtualMachine.Config.MksControl",
    "VirtualMachine.Config.DiskExtend",
    "VirtualMachine.Config.EditDevice",
    "VirtualMachine.Config.QueryFTCompatibility",
    "VirtualMachine.Config.QueryUnownedFiles",
    "VirtualMachine.Config.ReloadFromPath",
    "VirtualMachine.Config.RemoveDisk",
    "VirtualMachine.Config.Rename",
    "VirtualMachine.Config.ResetGuestInfo",
    "VirtualMachine.Config.Annotation",
    "VirtualMachine.Config.ChangeTracking",
    "VirtualMachine.Config.ToggleForkParent",
    "VirtualMachine.Config.UpgradeVirtualHardware",
    "VirtualMachine.GuestOperations.ModifyAliases",
    "VirtualMachine.GuestOperations.QueryAliases",
    "VirtualMachine.GuestOperations.Modify",
    "VirtualMachine.Inventory.CreateFromExisting",
    "VirtualMachine.Inventory.Create",
    "VirtualMachine.Inventory.Move",
    "VirtualMachine.Inventory.Register",
    "VirtualMachine.Inventory.Delete",
    "VirtualMachine.Inventory.Unregister",
    "VirtualMachine.Interact.DeviceConnection",
    "VirtualMachine.Interact.SESparseMaintenance",
    "VirtualMachine.Interact.PowerOff",
    "VirtualMachine.Interact.PowerOn",
    "VirtualMachine.Interact.Reset",
    "VirtualMachine.Interact.Suspend",
    "VirtualMachine.Provisioning.DiskRandomAccess",
    "VirtualMachine.Provisioning.CloneTemplate",
    "VirtualMachine.Provisioning.Clone",
    "VirtualMachine.Provisioning.Customize",
    "VirtualMachine.Provisioning.DeployTemplate",
    "VirtualMachine.Provisioning.PromoteDisks",
    "VirtualMachine.Provisioning.ReadCustSpecs",
    "VirtualMachine.State.CreateSnapshot",
    "VirtualMachine.State.RemoveSnapshot",
    "VirtualMachine.State.RenameSnapshot",
    "VirtualMachine.State.RevertToSnapshot",
    "InventoryService.Tagging.AttachTag",
    "InventoryService.Tagging.ObjectAttachable",
    "InventoryService.Tagging.CreateTag",
    "InventoryService.Tagging.CreateCategory",
    "InventoryService.Tagging.DeleteTag",
    "InventoryService.Tagging.DeleteCategory"
  ]
}
