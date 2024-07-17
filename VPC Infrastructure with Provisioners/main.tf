# Specify Provider in use

provider "aws" {  
  region = "us-east-1"
}

# AWS Key Pair

resource "aws_key_pair" "sam-key" {
  key_name   = "sam-key"
  public_key = file("~/.ssh/sam-key.pub")
}

# Create VPC

resource "aws_vpc" "sam-vpc" {
  cidr_block = var.cidr
}

# Create a Public Subnet

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.sam-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_customer_owned_ip_on_launch = true
}

# Create an Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.sam-vpc.id
}

# Create a Route Table and Route Table Association

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.sam-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.RT.id
}

# Create a Security Group for Ingress (HTTP & SSH) and Egress.

resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.sam-vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 Instance

resource "aws_instance" "ec2-provisioner" {
  ami                    = "ami-0261755bbcb8c4a84"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.sam-key.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.pub_subnet.id

# Create Provisioners - Remote Exec & File Provisioners

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("~/.ssh/sam-key.pub")  # Replace with the path to your private key
    host        = self.public_ip
  }

  # File Provisioner
  provisioner "file" {
    source      = "app.py"  # Replace with the path to your local file
    destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
}