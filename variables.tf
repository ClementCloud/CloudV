variable "default_tags" {
  description = "Default resource tags"
  type        = map(string)
  default     = {}
}
variable "region" {
    description = "The region where the resources will be created."
    type        = string
    default     = "us-east-1"
 
}
variable "vpc_definitions" {
  type = map(object({
    project_name   = optional (string, "cfproject")
    environment    = optional (string, "dev")
    region         = optional (string, "us-east-1")
    cidr_block     = optional (string, "10.0.0.0/16")
    subnet_count   = optional (number, 3)
    override_tags  = optional (string, "{}")
  }))

}