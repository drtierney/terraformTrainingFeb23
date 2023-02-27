# terraformTrainingFeb23
This repo contains provided examples and assigned tasks from a Terraform training course attended in Feburary 2023.  

## Examples
### Modules
Modules are used to encapsulate groups of resources dedicated to one task, reducing the amount of code you have to develop for similar infrastructure components.  

In the example, two different ec2 modules have been created:
- The finance ec2 module only allows for the instance name and environment tag value to be provided, other attributes are defined within the module.
- The hr ec2 module allows more choices such as the ami id, instance type and the number of instances to be built.

### Provisioners
Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction. Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.  
NOTE: its recommended to use Provisioners as a last resort due to the complexity and uncertainty they add to Terraform usage.

In the example, two kinds of provisioners are used:
- local-exec --> runs on the local machine running Terraform: in this case we are getting the current timestamp and outputting to a log file
- remote-exec --> runs on the created resource: in this case we are running commands against a Ubuntu image to download the latest updates, install the mini-httpd package and start up the service

### Workspaces
Workspaces in Terraform are simply independently managed state files. A workspace contains everything that Terraform needs to manage a given collection of infrastructure, and separate Workspaces function like completely separate working directories. We can manage multiple environments with Workspaces.  

In the example, a *.tfvars file has been created for each workspace, so when calling terraform plan/apply within the workspace the correct tfvars file is selected.  

### Terraform Cloud (tfcloud)
Terraform Cloud is HashiCorp’s managed service offering. It eliminates the need for unnecessary tooling and documentation for practitioners, teams, and organizations to use Terraform in production.

In the example, the organization and workspace have been defined in the provider.tf file which updates the backend to store the state file on the Terraform Cloud infrastructure. 

## Tasks
### Task 1
Create a AWS EC2 instance using variables for all attributes.  
The variable(s) definition(s) must be split out into a separate file.  
Ensure that any sensitive data isn't stored within the files.

### Task 2
Create a AWS VPC with 5 Subnets in a separate Terraform directory.  
Create a EC2 instance for each subnet from the preexisting VPC.  
Create a Security Group with SSH and ICMP inbound and all outbound and attach the Security Group to the newly created EC2 Instance(s).

### Task 3
Create a module with templates for:
- VPC and Subnets
- Security Groups
- EC2 instances

Using the module create:
- 1 x VPC
- 2 x Subnets
- 2 x EC2 instances in 1st Subnet
- 2 x EC2 instances in 2nd Subnet

Ensure that the AWS provider is configured to use "profile".  
Ensure that a S3 bucket is used for the backend.

### Task 4
Use Terraform cloud to store the state file but also make a copy of the state file into a S3 bucket.
