provider "aws" {
  region = "us-east-1"
}

# vpc module
module "vpc" {
  source = "./modules/vpc"
  cidr   = "10.0.0.0/16"  #Replace with your custom cidr
}

#subnet module
module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.0.0/24"  #Replace with your custom cidr
  availability_zone = "us-east-1a"
}


# Internet Gateway Module
module "internet_gateway" {
  source   = "./modules/internet_gateway"
  vpc_id   = aws_vpc.main_vpc.id
  igw_name = "Main-IGW"
}

# Route Table Module
module "route_table" {
  source    = "./modules/route_table"
  vpc_id    = aws_vpc.main_vpc.id
  gateway_id = module.internet_gateway.internet_gateway_id
  subnet_id = aws_subnet.main_subnet.id
  rt_name   = "Main-Route-Table"
}

#security group module
module "security_group" {
  source = "./modules/security_group"
  name   = "web"
  vpc_id = module.vpc.vpc_id
}

#ec2 instance module
module "ec2_instance" {
  source            = "./modules/ec2_instance"
  ami_id            = "ami-053b0d53c279acc90"   #Replace with your  ami
  instance_type     = "t2.micro"                #Replace with your instance type
  security_group_id = module.security_group.security_group_id
  subnet_id         = module.subnet.subnet_id
}




resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"  #Replace with your custom name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
