module "vpc1" {
  source = "./modules/vpc"
  project_name = "cfproject"
  region = "us-east-2"
  subnet_length = 5
  subnet_count = 5
  
}
module "vpc2" {
  source = "./modules/vpc"
  project_name = "cfproject"
  region = "us-east-2"
  subnet_length = 5
  subnet_count = 5
  
}
module "vpc3" {
  source = "./modules/vpc"
  project_name = "cfproject"
  region = "us-east-2"
  subnet_length = 5
  subnet_count = 5
  
}
