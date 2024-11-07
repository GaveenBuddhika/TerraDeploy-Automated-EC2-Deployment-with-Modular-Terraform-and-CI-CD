variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "gateway_id" {
  description = "The ID of the Internet Gateway."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
  type        = string
}

variable "rt_name" {
  description = "The name tag for the Route Table."
  type        = string
  default     = "Route-Table"
}
