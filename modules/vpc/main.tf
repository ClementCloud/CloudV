
# Create a VPC
resource "aws_vpc" "test" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  
  tags = {
    name = "${var.name}-vpc"
  }
}
resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.test.id

  tags = {
    name = "${var.name}-igw"
  }
  
}

data "aws_availability_zones" "aws_availability_zones" {
  
}

resource "aws_subnet" "public_subnet" {
 count                   = var.subnet_count
 vpc_id                  = aws_vpc.test.id
 cidr_block              = local.subnet_cidr_blocks[count.index]
 availability_zone       = data.aws_availability_zones.aws_availability_zones.names[count.index % length(data.aws_availability_zones.aws_availability_zones.names)]
 map_public_ip_on_launch = true

  tags = {
    name = "${var.name}-pub-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.test.id
  cidr_block              = local.subnet_cidr_blocks[count.index]
  availability_zone       = data.aws_availability_zones.aws_availability_zones.names[count.index % length(data.aws_availability_zones.aws_availability_zones.names)]
  map_public_ip_on_launch = true

  tags = {
    name = "${var.name}-priv-subnet-${count.index + 1}"
  }
}
