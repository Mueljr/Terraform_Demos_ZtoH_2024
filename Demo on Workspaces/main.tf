# Provider

provider "aws" {
  region = "us-east-1"
}

# Resources

resource "aws_instance" "demo-on-workspaces" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}

module "ec2_instance" {
  source = "./modules/ec2_instances"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}