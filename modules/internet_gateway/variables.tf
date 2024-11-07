variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway."
  type        = string
  default     = "Internet-Gateway"
}
