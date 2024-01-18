
# Create a VPC
resource "aws_vpc" "test" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = var.tags
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
  for_each = local.public_subnet_cidr_blocks
  vpc_id = aws_vpc.test.id
  cidr_block = each.value
  availability_zone = data.aws_availability_zones.aws_availability_zones.names[tonumber(each.key) % length(data.aws_availability_zones.aws_availability_zones.names)]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-pub-subnet-${tonumber(each.key) + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = local.private_subnet_cidr_blocks
  vpc_id = aws_vpc.test.id
  cidr_block = each.value
  availability_zone = data.aws_availability_zones.aws_availability_zones.names[tonumber(each.key) % length(data.aws_availability_zones.aws_availability_zones.names)]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-priv-subnet-${tonumber(each.key) + 1}"
  }
}
