# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "vpcs" {
  source         = "./modules/vpc"

  for_each       = var.vpc_definitions

  name           = "${each.value.project_name}-${each.value.environment}-${each.key}"
  region         = each.value.region
  cidr_block     = each.value.cidr_block
  subnet_count   = each.value.subnet_count
  tags           = merge(var.default_tags,jsondecode(each.value.override_tags))
}
