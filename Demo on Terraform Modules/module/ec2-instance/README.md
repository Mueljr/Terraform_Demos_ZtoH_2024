This demo seeks to provide a simple modular approach to creating an EC2 instance for a potential development team. 

It consists of a provider.tf file, a main.tf file, as well as a variables and outputs Terraform files respectively.

Variables.tf file contains variables for the ami of the instance, instance type, and key name value.

Outputs.tf file, in this case, is configured to print out the public IP address whenever an instance is created, for the team to be aware of, and to save them time of searching.