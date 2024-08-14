# Upgrade to vCenter 8.0 U1 and ESXi 8.0 U1

This folder contains the JSON and PowerShell scripts used to upgrade the KTEN vCenter and ESXi hosts
from 6.7 to 8.0.  

The upgrade process will follow the steps outlined in the VMware Documentation:

* [vCenter Server Upgrade](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-vcenter-upgrade/GUID-9ED7B32A-019F-4A97-BC58-1A9BF7D16C57.html)
* [VMware ESXi Upgrade](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-esxi-upgrade/GUID-65B5B313-3DBB-4490-82D2-A225446F4C99.html)

The upgrade process will leverage the Command Line Interface options to the greatest extent in order
to eliminate opportunities to miss a step in the process.

## Process

1. Backup the vCenter Configuration
2. Consolidate the Platform Services Controller and the vCenter Appliance
3. Upgrade the vCenter Appliance
4. Verify Appliance Operational State
5. Upgrade ESXi Hosts in Cluster

## Requirements

In order to execute these scripts, you will need [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel?view=powershell-7.3).
