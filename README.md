# terraform-demo
Terraform AWS examples

### VPC and EC2 provisioning with module 
This terraform demo provisions VPC with public and private subnet(without NAT GW). It also
provisions EC2 in public subnet.
Change parameter value as needed and execute below commands to create and destroy resources:
```
terraform init

terraform apply \
-var 'ec2_ami=<ami-id>' \
-var 'ec2_sg_cidr=["<ip-cidr>"]'

terraform destroy \
-var 'ec2_ami=<ami-id>' \
-var 'ec2_sg_cidr=["<ip-cidr>"]'
```
**Note:** Modify `terraform.tfvars` and `variable.tf` files as needed.



