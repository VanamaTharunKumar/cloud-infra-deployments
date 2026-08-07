provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Environment = "Development"
    Project     = "Demo"
  }
}

resource "aws_internet_gateway" "igw-dev" {
  vpc_id = aws_vpc.vpc-dev.id
  tags = {
    Environment = "Development"
    Project     = "Demo"
  }
}

resource "aws_subnet" "subnet-public-01" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Environment = "Development"
    Project     = "Demo"
  }
}

resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc-dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-dev.id
  }

  tags = {
    Environment = "Development"
    Project     = "Demo"
  }
}

resource "aws_route_table_association" "rt-assoc" {
  subnet_id      = aws_subnet.subnet-public-01.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_security_group" "web-server-sg" {
  name   = "web-server-sg"
  vpc_id = aws_vpc.vpc-dev.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "Development"
    Project     = "Demo"
  }
}

data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.subnet-public-01.id
  vpc_security_group_ids = [aws_security_group.web-server-sg.id]
  key_name               = var.ssh_key_name
  monitoring             = true

  tags = {
    Name        = "web-server"
    Environment = "Development"
    Project     = "Demo"
  }
}