#Terraform  
This project will create two EC2 unstance under dedicated VPC which is under ELB.
Prerequisite:
Make sure you are passing the appropriate key in *public_key* scetion.

To initialise the provider plugins and etc
```
terraform init
```

To run the dry run of your infra
```
terraform plan
```

This is the actual run which will apply the change to your Infrastructure.
```
terraform apply
```
