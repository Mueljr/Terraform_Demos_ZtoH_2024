output "public-ip-address" {
  value = aws_instance.ec2-instance-module-teamA.public_ip
}