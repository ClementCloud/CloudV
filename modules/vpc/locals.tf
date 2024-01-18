locals {
  vpc_name = "${var.project_name}-vpc"
  subnet_count = length(var.subnet_cidr_blocks)
  subnet_cidr_formula = cidrsubnet(var.vpc_cidr_block, var.subnet_cidr_bits, count.index)
}