resource "aws_instance" "basic-ec2-terraform" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "key-instance1"
}