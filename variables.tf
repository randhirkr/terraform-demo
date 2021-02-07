variable "aws_region" {
  description = "VPC default region"
  default = "us-east-1"
}

variable "aws_profile" {
  description = "default profile"
  default = "default"
}

variable "ec2_sg_cidr" {
  type = list(string)
  description = "CIDR for EC2 security group"
}

variable "ec2_ami" {

}