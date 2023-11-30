terraform {
  required_providers {
    aws={
       source = "hashicorp/aws"
       version = "~> 5.0"
    }
  }
}

#configure provider and region
provider "aws" {
    region = "ap-south-1"
    shared_config_files =["/home/ec2-user/.aws/config"]
    shared_credentials_files =["/home/ec2-user/.aws/credentials"]

}

#configure EC2 instance
resource "aws_instance" "instance_1" {
  ami = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"

  subnet_id = aws_default_subnet.default.id
  tags = {
    Name = "Instance_1"
  }

}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
  availability_zone = "ap-south-1b"  # Choose an availability zone in your region
}
