Workspaces while implementing Terraform based operations are super important!

When a simple infrastructure like creating an EC2 instance is configured in a terraform file, along with the necessary variables, as well as any real-time, sensitive information in the "terraform.tfvars" file, what is left is 2 major things, naturally - terraform init, terraform apply.

Awesome! However, there are two challenges.

First, it's easier to store configurations with the modular approach as already done in one of the demos on here. So, you can have a module for EC2 instance, S3 buckets, VPC setup, and what a view - keeping you super organized and ready for any deployment.

After modules are created, the ultimate project file must be created (main.tf) to build on any module's configuration as needed, along with its required variables + a terraform.tf vars file

This way, from our root directory, we have: 

TERRAFORM FILES FOR ORGANIZATION ABC 
                -
                -
    main.tf     +    terraform.tfvars  +  statefile

Looks good! But there is another issue. Ideally, there are three (3) environments in cloud deployment - development (dev), staging (stage), and production (prod).

Say Mr A works in the dev environment, and he wants to create an EC2 instance, he's going to be successful with it, as it'd get created + a statefile created.

Now, Mr B works in the stage environment, and wants to create another EC2 instance the following day + maybe an S3 bucket. He refers to two modules for this, and he's successful. Great! But something has been overwritten. The statefile has been overwritten which messes with the memory of what Mr A created the day before.

To solve this issue, Terraform has provided the concept of **'WORKSPACES'**

With this, if anyone from any environment works in their designated workspace, they have their statefile created per environment, hence, avoiding any form of overlapping no matter the environment you're working in.

Each workspace has their authentications done in there, while feeding on the information provided in the main.tf file in the root directory. 

Each workspace also has their own specialized statefile after every terraform init, apply. Also, a specialised .tfvars file can be created for each environment, so the terraform.tfvars file in the root directory isn't modified all the time - dev.tfvars, stage.tfvars, prod.tfvars

Essentially, one ultimate project (main.tf) that can be modified by anyone, but effective in their environment; 3 workspaces (dev, stage, prod); numerous modules to build on and authenticate from.

So, our tree turns out like this:

         TERRAFORM FILES FOR ORGANIZATION ABC 
            |                   |          |
            |                   |          |
main.tf + terraform.tfvars   .terraform    modules
     + statefile                |             |    \
                                |             |        \
                            environment   ec2_instance  S3_buckets etc.               
                             |   |     \
                            |    |        \
                           dev  stage       prod    
                           |     |                \
                           |     |                      \
        statefile + dev.tfvars statefile + stage.tfvars  statefile + prod.tfvars
