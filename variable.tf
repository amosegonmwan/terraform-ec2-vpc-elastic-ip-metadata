variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "ec2_instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "keypair_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "demo-key-oregon"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tags" {
  description = "This is my map"
  type        = map(any)
  default = {
    front-tier  = "FrontEnd-EC2"
    back-tier = "BackEnd-EC2"
  }
}
