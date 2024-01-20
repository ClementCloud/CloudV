
# Create a VPC
resource "aws_vpc" "test" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  
  tags = {
    Name = "${var.name}-vpc"
  }
}
resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "${var.name}-igw"
  }
  
}

data "aws_availability_zones" "aws_availability_zones" {
  
}

resource "aws_subnet" "public_subnet" {
 count               = var.subnet_count > 0 ? var.subnet_count : 1
 vpc_id              = aws_vpc.test.id
 cidr_block          = cidrsubnet(var.cidr_block, var.subnet_length, count.index)
 availability_zone   = data.aws_availability_zones.aws_availability_zones.names[count.index % length(data.aws_availability_zones.aws_availability_zones.names)]
 map_public_ip_on_launch = true

 tags = {
  Name = "${var.name}-pub-subnet-${count.index + 1}"
 }
}

resource "aws_subnet" "private_subnet" {
 count               = var.subnet_count > 0 ? var.subnet_count : 1
 vpc_id              = aws_vpc.test.id
 cidr_block          = cidrsubnet(var.cidr_block, var.subnet_length, count.index + var.subnet_count)
 availability_zone   = data.aws_availability_zones.aws_availability_zones.names[count.index % length(data.aws_availability_zones.aws_availability_zones.names)]
 map_public_ip_on_launch = false

 tags = {
  Name = "${var.name}-priv-subnet-${count.index + 1}"
 }
}

