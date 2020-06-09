# kpmg

## challenge 1

terraform to provision three teir app on azure

note: most scripts the default from hashicorp - wanted to chow structure and keeping all vars to vars.tf etc

to code in the pipeline:
- stage 1 teraform init
- stage 2 some json replacement
- stage 3 get some dunamic variables
- stage 4 terraform plan
- final - produce an artifact to be consumed by a release to then terraform apply with approvals

## challenge 2

powershell function to query metadata - assumes config completed to open connection

## challenge 3