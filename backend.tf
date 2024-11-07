terraform {
  backend "s3" {
    bucket         = "gaveen-terraform"  # Replace with your S3 bucket name
    key            = "gaveen/terraform.tfstate"             # Replace with your desired state file path
    region         = "us-east-1"                             # Replace with your AWS region
    encrypt        = true
    dynamodb_table = "terraform-lock"
                    
  }
}
