# Project File Overview

This document provides a summary of each file within this Terraform project and its specific purpose.

## Terraform Configuration Files (`.tf`)

These files contain the HashiCorp Configuration Language (HCL) code that defines the infrastructure.

- **`main.tf`**
  - **Purpose**: This is the primary entrypoint for the Terraform configuration. While other files might define specific components like networking, this file typically contains the core resources to be provisioned, such as EC2 instances, and may reference resources defined in other files.

- **`vpc.tf`**
  - **Purpose**: This file is dedicated to defining the networking components of the infrastructure. It includes the AWS VPC, public and private subnets, an Internet Gateway, route tables for traffic management, and security groups that act as virtual firewalls. Separating networking logic into its own file improves modularity and readability.

- **`variables.tf`**
  - **Purpose**: This file contains all the input variable declarations for the project. By declaring variables here (e.g., for instance sizes, region, or tags), the configuration becomes flexible and reusable without needing to hard-code values in the resource definitions.

- **`outputs.tf`**
  - **Purpose**: This file defines the output values that you want to easily access after Terraform applies the configuration. For example, you can output an EC2 instance's public IP address or a VPC's ID. These values are displayed in the console after a successful `terraform apply`.

## Terraform Variable and State Files

- **`terraform.tfvars`**
  - **Purpose**: This file is used to provide concrete values for the variables declared in `variables.tf`. This is the standard way to set environment-specific values (e.g., development vs. production). This file should **not** be committed to version control as it may contain sensitive information.

- **`.tfstate` / `.tfstate.backup`**
  - **Purpose**: These are the Terraform state files, which are automatically generated. They store a record of the infrastructure managed by Terraform. This is how Terraform knows what it created and how to update or destroy it. These files are critical and should be handled with care (ideally using remote state backends) and **never** be committed to version control.

## Project Documentation and Git

- **`Readme.md`**
  - **Purpose**: The main documentation file for the project. It provides a high-level overview, prerequisites, setup instructions, and a guide to the basic Terraform workflow. It is the starting point for any user of the repository.

- **`Agent.md`** (This file)
  - **Purpose**: To provide a detailed breakdown and purpose of every file in the project, serving as a quick reference for developers.

- **`.gitignore`**
  - **Purpose**: This is a configuration file for Git that specifies which files and directories should be ignored and not tracked by version control. It is correctly configured to exclude state files, local Terraform caches, and other non-source files.

- **`git.txt`**
  - **Purpose**: A text file containing a sequence of Git commands. It appears to be a personal script or note for resetting the local Git repository and force-pushing it to the remote `origin`. This is for repository administration and not part of the infrastructure code.
