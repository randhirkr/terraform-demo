resource "aws_security_group" "ssh" {
  name = "ssh-sg"
  vpc_id = var.vpc_id
  ingress {
      from_port   = 22
      to_port     = 100
      protocol    = "tcp"
      cidr_blocks = var.ec2_sg_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-sg"
  }
}

resource "aws_key_pair" "ec2_key" {
  key_name = "ran-key"
  public_key = file(var.ran_public_key_path)
}

resource "aws_instance" "ran_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  subnet_id = var.pub_subnet_id
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name = aws_key_pair.ec2_key.key_name
  tags = {
    Name = "ran-ec2"
 }
}