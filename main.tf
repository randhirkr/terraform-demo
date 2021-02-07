module "ran-vpc" {
	source = "./modules/vpc"
}

module "ran-ec2" {
	source = "./modules/ec2"
	ec2_ami = var.ec2_ami
	ec2_sg_cidr = var.ec2_sg_cidr
	pub_subnet_id = module.ran-vpc.subnet_id
	vpc_id = module.ran-vpc.vpc_id
}
