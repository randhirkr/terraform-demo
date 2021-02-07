resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
       Name =  var.vpc_name
    }
}

# create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.vpc_name}-igw"
  }
}

# Create public subnets
resource "aws_subnet" "pub_subnets" {
  count = length(var.pub_subnets_cidr)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.pub_subnets_cidr,count.index)
  map_public_ip_on_launch = "true"
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "pub-${var.vpc_name}-sub-${element(var.azs,count.index)}"
  }
}

# Create public Route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pub-${var.vpc_name}-rt"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "pub" {
  count = length(var.pub_subnets_cidr)
  subnet_id      = element(aws_subnet.pub_subnets.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}



# Create private subnets
resource "aws_subnet" "priv_subnets" {
  count = length(var.priv_subnets_cidr)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.priv_subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "priv-${var.vpc_name}-sub-${element(var.azs,count.index)}"
  }
}

# Create private Route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "priv-${var.vpc_name}-rt"
  }
}

# Route table association with private subnets
resource "aws_route_table_association" "priv" {
  count = length(var.priv_subnets_cidr)
  subnet_id      = element(aws_subnet.priv_subnets.*.id,count.index)
  route_table_id = aws_route_table.private_rt.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.pub_subnets[0].id
}
