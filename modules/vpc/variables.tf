variable "project_name" {
  type = string
  default = "cloudV"
}
variable "region" {
  type = string
}
variable "environment" {
  type = string
}

variable "default_tags" {
  type = map(string)
  default = {}
}
variable "vpc_cidr_block" {
  type    = string
  description = "The CIDR block for the VPC"
}

variable "subnet_cidr_blocks" {
  type    = list(string)
  description = "The CIDR blocks for the subnets"
}

variable "availability_zones" {
  type    = list(string)
  description = "The availability zones for the subnets"
}

variable "security_group_ids" {
  type    = list(string)
  description = "The IDs of the security groups to associate with the VPC"
}