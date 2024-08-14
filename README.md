# Terraform Plan and Ansible Playbook to Conduct SCAP Compliance Check Audit of RHEL 8 Baseline

This playbook will deploy and perform an audit on a system using the DISA SCAP Compliance Checker tool.

## Instructions

In order to run this audit, you will need to copy/rename the `enclave.tfvars.example` file to `enclave.tfvars` and edit it
with values that are appropriate for your environment.  Once that is complete and the assessment details are defined,
type the following to run deploy the System Under Test and run the assessment:

```cmd
./provision.sh
```

Once complete, you should see a folder under the files folder with the IP address of the system under test. This will 
also remove the created virtual machine from the server as it is no longer required.

This does not remove the results.
