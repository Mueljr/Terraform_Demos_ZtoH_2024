The relevance of Terraform modules can't be over-emphasized. As a DevOps engineer, instead of storing configurations of resources for development teams as a 'monolithic' configuration, it is best to follow a modular approach.

This helps in fixing buhs quickly, with better organization, other than scanning through an endless list of configurations in case there's an error somewhere.

Terraform Modules allows for 'Modularity' - to break an entire infrastructure's configuration into smaller, self-contained components.

Other benefits of employing Terraform modules include reusability, in that reusable templates will be created for future projects; simplfied collaboration, better versioning and maintenance, better testing, validation, and documentation, and what a view, all include the significant gains by employing the concept of Terraform modules.

For better access for users, as in a production environment, a **main.tf** file is created in this directory.

File contains provider and EC2 module configurations, respectively. This acts as a simplified means that can be given to teams to quickly run & automate with, assuming the modular files (e.g. main, variables, outputs, etc.) have been created for a particular resource on AWS.
