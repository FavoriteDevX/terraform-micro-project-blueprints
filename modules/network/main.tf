resource "aws_vpc" "micro_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "micro-project-vpc"
    Environment = "Production"
    CostCenter  = "Free-Tier"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.micro_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "micro-project-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.micro_vpc.id
  tags   = { Name = "micro-project-igw" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.micro_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

output "vpc_id" { value = aws_vpc.micro_vpc.id }
output "subnet_id" { value = aws_subnet.public_subnet.id }
