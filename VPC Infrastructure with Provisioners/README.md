Provisioners are used daily to perform complex tasks on Terraform that would naturally require shell scripting separately.

They help to execute and implement the process of creation, and to execute some actions at the time of creation or deletion of a process.

They are basically grouped into three (3) parts - 'Remote exec provisioner', which helps to connect to an instance or server, and execute commands, 'Local exec provisioner', which is used to copy an output to a particular file, and 'File provisioner', which is typically used to copy files from a local space or server to a remote EC2 instance.

This project basically creates a simple VPC infrastructure on AWS, implemented with Terraform. 

A public subnet is created, with an internet gateway, route tables, security groups, and an EC2 instance where the app file will be launched.

The simple app file is implemented with Python, and executed with Terraform provisioners.

For provisioners, in this demo, only remote exec, and file provisioners are used.