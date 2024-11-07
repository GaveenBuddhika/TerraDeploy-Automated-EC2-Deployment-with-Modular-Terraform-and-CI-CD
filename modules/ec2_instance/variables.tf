
variable "instance_type" {
  type = string
  description = "EC2 instance type"
  
}

variable "subnet_id" {
  type = string
  description = "Subnet ID for the instance"
  
}

variable "ami_id" {
  type = string
  description = "AMI ID for the instance"
}