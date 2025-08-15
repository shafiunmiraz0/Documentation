terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.53.0"
    }
  }
}

provider "aws" {
  access_key = "AKIA4MTWJEQSOSIEGOG" # Avoid hardcoding credentials, use environment variables instead
  secret_key = "5DMYkoy/scIBoCseqhCLlXTUWTRD5vAHlHjGXz9"
  region     = "ap-south-1"
}

resource "aws_instance" "MyFirstInstance" {
  count         = 2
  ami           = "ami-053b12d3152c0cc71" # Replace with a valid AMI ID for us-east-2
  instance_type = "t2.micro"

  tags = {
    Name = "demoinstance-${count.index}"
  }
}

