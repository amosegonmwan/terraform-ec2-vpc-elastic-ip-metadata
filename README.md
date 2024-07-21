# Terraform AWS EC2 Setup with Elastic IP and Metadata Access

## Project Overview

This project sets up an AWS EC2 instance using Terraform, with the following features:
- Utilizes variables and data sources for configuration.
- Installs and configures an HTTP server using user data.
- Attaches an Elastic IP to the EC2 instance.
- Provides access to instance metadata via a web browser.

![image](https://github.com/user-attachments/assets/cd9ffde7-5ff7-466a-9dc1-e4776a770781)


## File Structure

1. **provider.tf**: Configuration for the AWS provider.
2. **data.tf**: Data source for the latest Amazon Linux AMI.
3. **variable.tf**: Definition of variables used in the project.
4. **vpc.tf**: Configuration for the VPC, subnets, and related resources.
5. **app.sh**: User data script to install and configure HTTP server.
6. **ec2.tf**: Configuration for the EC2 instances and Elastic IP attachment.
7. **security-group.tf**: Security groups for allowing necessary traffic.
8. **output.tf**: Outputs to display the public IP and URLs.

## Configuration Details

### provider.tf

Sets the required Terraform and AWS provider versions and configures the AWS region.

### data.tf

Retrieves the latest Amazon Linux AMI from AWS.

### variable.tf

Defines the variables used throughout the configuration, including AWS region, instance type, key pair name, VPC CIDR block, and instance tags.

### vpc.tf

Configures the VPC, public and private subnets, Internet Gateway, NAT Gateway, route tables, and route table associations.

### app.sh

User data script to install and start the HTTP server, and set up the web content and instance metadata access.

### ec2.tf

Configures the EC2 instances, attaches an Elastic IP, and sets up instance metadata options.

### security-group.tf

Configures security groups to allow SSH and HTTP traffic.

### output.tf

Outputs the public IP address and URLs to access the home page, app1 page, and instance metadata.

## Usage

1. Clone the repository.
2. Configure your AWS credentials.
3. Initialize Terraform.
4. Apply the Terraform configuration.
5. Access the instance using the provided URLs in the outputs.

This setup ensures that your EC2 instance is properly configured with an HTTP server and accessible metadata, providing a robust and easily reproducible infrastructure.
