
# TerraDeploy - Automated EC2 Deployment with Modular Terraform and CI/CD

## Overview
TerraDeploy is a modular Terraform project that automates the provisioning of an AWS EC2 instance with a complete networking setup, including VPC, subnets, Internet gateway, route tables, and security groups. This project utilizes S3 for backend state management, DynamoDB for state locking, and CI/CD automation via GitHub Actions to ensure seamless deployments on every push.

## Project Features
- **Modular Terraform Structure**: Organized Terraform modules for VPC, subnets, Internet gateway, route tables, security groups, and EC2 instances.
- **S3 Backend**: State management using AWS S3 for storing the Terraform state file.
- **DynamoDB Locking**: State locking implemented with DynamoDB to prevent race conditions during concurrent runs.
- **CI/CD Integration**: GitHub Actions pipeline for automated deployment on code push, enabling consistent, repeatable infrastructure changes.

## Modules
The project is organized into the following Terraform modules:
1. **VPC Module**: Creates a custom VPC with specified CIDR block.
2. **Subnet Module**: Provisions public or private subnets within the VPC.
3. **Internet Gateway Module**: Sets up an Internet gateway for public subnets.
4. **Route Table Module**: Creates and associates route tables for traffic routing.
5. **Security Group Module**: Configures security rules to allow or restrict traffic.
6. **EC2 Instance Module**: Launches an EC2 instance in the specified subnet.

## CI/CD Pipeline
GitHub Actions is used to automate the deployment process:
1. **Checkout Code**: Pulls the latest code from the repository.
2. **Terraform Initialization**: Initializes Terraform with backend configurations.
3. **Terraform Validation**: Validates the Terraform configuration files.
4. **AWS Credentials Configuration**: Configures AWS credentials using GitHub Secrets for secure access to AWS resources.
5. **Terraform Plan**: Creates an execution plan for the changes.
6. **Terraform Apply**: Deploys the infrastructure automatically on approved branches.

## Setup Instructions

### Prerequisites
- **AWS CLI**: Configure AWS CLI with the required credentials.
- **Terraform**: Install Terraform v1.3.0 or later.

### Configuration

1. **Backend Configuration**: The `backend.tf` file is set up to use S3 and DynamoDB for state management and locking.
2. **Environment Variables**: Set up the following GitHub secrets for AWS authentication:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`

### Run Locally
1. Clone the repository:
   ```bash
   git clone https://github.com/GaveenBuddhika/TerraDeploy-Automated-EC2-Deployment-with-Modular-Terraform-and-CI-CD.git
   cd TerraDeploy-Automated-EC2-Deployment-with-Modular-Terraform-and-CI-CD
   ```
2. Initialize and apply Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Contributing
Feel free to contribute by submitting issues or pull requests to improve this project.

