resource "aws_instance" "ec2-instance-module-teamA" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  key_name = var.key_name_value
}