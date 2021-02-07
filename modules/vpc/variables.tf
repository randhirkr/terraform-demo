variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.137.23.0/25"
}

variable "vpc_name" {
  description = "VPC name"
  default = "ran-vpc"
}

variable "pub_subnets_cidr" {
	type = list(string)
	default = ["10.137.23.0/27", "10.137.23.32/27"]
}

variable "priv_subnets_cidr" {
	type = list(string)
	default = ["10.137.23.64/27", "10.137.23.96/27"]
}

variable "azs" {
	type = list(string)
	default = ["us-east-1a", "us-east-1b"]
}


variable "pub_sub_az_a_name" {
  default = "pub-ran-sub-az-a"
}

variable "pub_sub_az_b_name" {
  default = "pub-ran-sub-az-b"
}

variable "priv_sub_az_a_name" {
  default = "pub-ran-sub-az-a"
}

variable "priv_sub_az_b_name" {
  default = "pub-ran-sub-az-b"
}
