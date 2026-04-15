# Terraform AWS Practice Project

This repository serves as a hands-on practice ground for learning and experimenting with Terraform to provision resources on AWS. It covers fundamental Terraform concepts, state management, and variable usage.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Terraform Workflow](#terraform-workflow)
- [Key Terraform Concepts](#key-terraform-concepts)

## Prerequisites

Before you begin, ensure you have the following installed:

- **AWS Account**: An active AWS account with credentials configured for Terraform to use (e.g., via environment variables or IAM roles).
- **Terraform CLI**: Installed on your local machine.
  ```bash
  terraform version
  ```

## Setup

1.  **Clone the Repository**:

    ```bash
    git clone https://github.com/LogeshITHub/Terraform-Practice-2.git
    cd Terraform-Practice-2
    ```

2.  **Initialize Terraform**:
    ```bash
    terraform init
    ```
    This command downloads the necessary providers and modules.

## Terraform Workflow

Once initialized, you can manage your infrastructure using the following commands:

- **Plan Changes**: Review the changes Terraform will make before applying them.
  ```bash
  terraform plan
  ```
- **Apply Changes**: Provision the resources defined in your Terraform configuration.
  ```bash
  terraform apply
  ```
- **Destroy Resources**: Remove all resources provisioned by this Terraform configuration.
  ```bash
  terraform destroy
  ```

## Key Terraform Concepts

This project touches upon several important Terraform concepts:

### 1. Using `tfvars` for Variables

`tfvars` files (e.g., `terraform.tfvars` or `*.auto.tfvars`) are used to provide input values for variables defined in your Terraform configuration. This helps in separating sensitive data or environment-specific values from your main `.tf` files.

**Example:**
If you have a variable `instance_type` defined, you can set its value in `terraform.tfvars`:

```hcl
instance_type = "t2.micro"
```

### 2. Renaming Resources in State (`terraform state mv`)

If you need to rename a resource in your Terraform configuration, you must also update its entry in the Terraform state file to avoid Terraform trying to destroy the old resource and create a new one. The `terraform state mv` command helps with this.

**Example:**
If you change `resource "aws_instance" "example"` to `resource "aws_instance" "web-server-1"` in your `.tf` file, you'd run:

```bash
terraform state mv aws_instance.example aws_instance.web-server-1
```

### 3. Inspecting Resources and State

To view the details of resources managed by Terraform or inspect the current state, you can use:

- **`terraform show`**: Displays the current state or a plan in a human-readable format.
  ```bash
  terraform show
  ```
- **`terraform state show <resource_address>`**: Shows the attributes of a specific resource in the state file.
  ```bash
  terraform state show aws_instance.web-server-1
  ```
