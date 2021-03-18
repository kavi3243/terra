# Terraform  
This will create infra with two EC2 instance with apache installed on two different availability zones under ELB. In addition, VPC, SG with required firewall rules. 
Once this is executed successfully, you will get the DNS name as an output to access the application. 


```
Eg:
Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

ec2_pub_ip = [
  "3.123.123.123",
  "52.12.34.567",
]
elb_dns = "myelb-123456789.us-east-2.elb.amazonaws.com"
```

**Prerequisite:** <br>
Install the Terraform v0.14.8 or above (https://www.terraform.io/) 
Make sure you are passing the appropriate key in *public_key* section and ami name ( based on the region)

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

To cleanup evertyhing, just run the below command which will destroy all the resouces which is created as part of this code.
```
terraform destroy
```