# kpmg

## challenge 1

terraform to provision three teir app on azure

firewall -> web -> firewall -> app -> firewall 

note: most scripts are the default ones from hashicorp - wanted to show structure and keeping all vars to vars.tf etc

Note - all end user / developer variables to be stored in library and all changes to be branched / pulled / approved

to code in the pipeline:
- stage 1 teraform init
- stage 2 some json replacement
- stage 3 get some dunamic variables
- stage 4 terraform plan
- final - produce an artifact to be consumed by a release to then terraform apply with approvals

## challenge 2

powershell function to query metadata - assumes config completed to open connection to aws

## challenge 3

doing at lunch - coffee time followed by standups and meetings 