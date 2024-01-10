#  resource "aws_vpc" "Frankfurt-vpc" {
#    cidr_block           = var.vpc_cidr_block
#    instance_tenancy     = "default"
#    enable_dns_hostnames = var.enable_dns_hostnames
#  
#    tags = local.resource_tags
#  }

resource "aws_subnet" "terraform-subnet-public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.vpc_subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone

  tags = local.resource_tags
}

resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = var.vpc_id

  tags = local.resource_tags
}

resource "aws_route_table" "terraform-rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.default_cidr_route
    gateway_id = aws_internet_gateway.terraform-igw.id
  }

  tags = local.resource_tags
}

resource "aws_route_table_association" "terraform-subnet-rta" {
  subnet_id      = aws_subnet.terraform-subnet-public.id
  route_table_id = aws_route_table.terraform-rtb.id
}
