provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "$insertamivalue"
  instance_type_value = "$insertinstancetypevalue"
  key_name_value = "$insertkeypairname"
}
