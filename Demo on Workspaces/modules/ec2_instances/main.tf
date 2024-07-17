# Provider

provider "aws" {
  region = "us-east-1"
}

# Variables

variable "ami" {
  description = "value for ami"
}

variable "instance_type" {
  description = "value for instance_type"
}

variable "key_name" {
  description = "value for key_name"
}

# Resources

resource "aws_instance" "demo-on-workspaces" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}