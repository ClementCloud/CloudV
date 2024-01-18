variable "project_name" {
  type = string
  default = "cloudV"
}

variable "environment" {
  type = string
}

variable "default_tags" {
  type = map(string)
  default = {}
}