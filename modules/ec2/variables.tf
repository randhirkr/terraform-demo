variable "ec2_sg_cidr" {
  type = list(string)
  description = "CIDR for EC2 security group"
}

variable "ran_public_key_path" {
  description = "ssh public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "ec2_ami" {

}

variable "ec2_type" {
  default = "t2.micro"
}

variable "vpc_id" {

}

variable "pub_subnet_id" {

}