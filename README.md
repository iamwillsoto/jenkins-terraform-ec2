# Jenkins on AWS — Terraform-Managed EC2 System

## Overview
This repository defines a reproducible Jenkins CI/CD control plane on AWS using Terraform.  
The system provisions a single EC2 instance in the default VPC, bootstraps Jenkins automatically at launch, and grants the instance scoped S3 access via an IAM role—without using static AWS credentials.

The objective is to demonstrate **production-aligned infrastructure design**, emphasizing repeatability, security, and explicit validation over manual configuration.

---

## System Architecture
- **Compute:** Amazon EC2 (Amazon Linux 2023)
- **CI/CD:** Jenkins (installed via EC2 user data at first boot)
- **Networking:** Default VPC with restricted security group ingress
- **Artifacts:** Private Amazon S3 bucket
- **Security:** IAM role + instance profile (no static credentials)
- **Provisioning:** Terraform

---

## Key Design Decisions
- **Infrastructure as Code:** All AWS resources are declared and versioned using Terraform.
- **Automated Bootstrapping:** Jenkins is installed and started automatically via EC2 user data.
- **Least-Privilege Access:** The EC2 instance assumes an IAM role with scoped S3 permissions.
- **No Static Credentials:** AWS access from the instance is performed exclusively through IAM role assumption.
- **Restricted Network Access:** SSH and Jenkins UI access are limited to explicit CIDR blocks.

---

## Deployment
From the repository root, deploy the system using Terraform:

```bash
cd infra
terraform init
terraform validate
terraform plan
terraform apply
```

Upon successful deployment, Terraform outputs the Jenkins public URL, instance IP address, and supporting resource identifiers.

---

## Verification

The system is explicitly validated through the following checks:

Terraform configuration validates successfully

Infrastructure is created without errors

Jenkins is reachable via port 8080

SSH access to the EC2 instance is functional

Jenkins completes initial setup and is operational

The EC2 instance assumes the expected IAM role

S3 read/write access is confirmed from the instance without AWS credentials


Validation evidence is provided in the validation-screenshots/ directory, including:

Jenkins installation via user data

Terraform initialization and validation

Successful Terraform apply

Jenkins dashboard access

SSH access to the EC2 instance

S3 upload, list, and delete operations performed using the instance IAM role

---

## Security Notes

Terraform state files are intentionally excluded from version control.

No AWS access keys or secrets are stored in this repository.

All AWS service access from the EC2 instance is performed via IAM role assumption.

Network access is restricted to explicitly defined CIDR ranges.

---

## Outcome

This system demonstrates a clean, repeatable Jenkins deployment on AWS using Terraform, aligned with real-world infrastructure practices.
It reflects production-aware design principles including automated provisioning, secure access patterns, and verifiable system behavior.