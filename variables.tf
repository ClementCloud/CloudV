
variable "vpc_definitions" {
  type = map(object({
    project_name = optional (string, "cfproject")
    environment = optional (string, "dev")
    region = optional (string, "us-east-1")
    cidr_block = optional (string, "10.0.0.0/16")
    subnet_length = optional (number, 4)
    subnet_count = optional (number, 3)
  }))

  
}
