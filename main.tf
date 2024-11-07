provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  cidr   = "10.0.0.0/16"
}

module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
}




module "ec2_instance" {
  source            = "./modules/ec2_instance"
  ami_id            = "ami-053b0d53c279acc90"
  instance_type     = "t2.micro"
  subnet_id         = module.subnet.subnet_id
}





resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
