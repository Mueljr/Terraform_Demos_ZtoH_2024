Demo simply aims to build on the significance of Terraform statefiles and the concept of remote backends.

Statefiles are simply known as the **'heart'** of Terraform. They store information of infrastructure created via Terraform.

They help to manage a Terraform infrastructure well, as well as aid to update an existing infrastructure.

In cases where files need to be created and deleted, statefiles also acts like a tool to confirm creation and deletion of files.

However, two notable drawbacks includes; Statefiles record everything, sensitive information inclusive. So, it might result in a security breach if care is not taken.

Secondly, based on the concept of Versioning Control System (VCS), code changes may not reflect in statefiles until it has been updated in the local repository, before it would be pushed remotely.

**FIX FOR BOTH DRAWBACKS - REMOTE BACKEND**

This concept allows statefiles to be created in S3 buckets, on AWS, for instance, other than locally or on the conventional means, such as a GitHub repository.

This way, permissions can be set to restrict certain information that would be stored on the statefile, as it is being stored on an S3 bucket.


In this directory, after the main.tf file was initiated and applied ('terraform init,' 'terraform apply'), a separate backend.tf file will be created with respect to pushing the statefile onto an already created S3 bucket.
