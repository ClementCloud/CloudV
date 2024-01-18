provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"

environment = "dev"
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_bits = 8
subnet_cidr_blocks = outputs.subnet_cidr_blocks
availability_zones = ["us-east-1a","us-east-1b","us-east-1c"]
}