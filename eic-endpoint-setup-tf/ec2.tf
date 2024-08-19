resource "aws_vpc" "demo" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "eic-endpoint-demo-vpc"
  }
}

resource "aws_subnet" "demo_private_subnet" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.ec2_instance_cidr

  tags = {
    Name = "eic-endpoint-demo-private-subnet"
  }
}

data "aws_ami" "demo_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "demo_instance" {
  ami                         = data.aws_ami.demo_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.demo_private_subnet.id
  associate_public_ip_address = "false"


  tags = {
    Name = "eic-endpoint-demo-instance"
  }
}
