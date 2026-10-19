# 🌍 Production-Hardened Terraform Blueprints for Micro-Projects

[![Terraform](https://shields.io)](https://terraform.io)
[![AWS Cloud](https://shields.io)](https://amazon.com)
[![Security: Hardened](https://shields.io)](https://amazon.comsecurity/)

A modular infrastructure-as-code (IaC) architectural blueprint engineered specifically for bootstrapping micro-projects safely within the **AWS Free Tier footprint**. It provisions an isolated Virtual Private Cloud (VPC), secure compute modules, and strictly restricted storage components with a strong focus on the Principle of Least Privilege.

---

## 💎 Structural Blueprint Layout

```text
[ Internet Gateway ]
         │
         ▼
 ┌────────────────────────────────────────────────────────┐
 │ Virtual Private Cloud (VPC)                            │
 │  ┌──────────────────────────────────────────────────┐  │
 │  │ Public Network Subnet (Zone A)                   │  │
 │  │   ┌──────────────────┐    ┌──────────────────┐   │  │
 │  │   │ Security Group   │───►│ EC2 Instance     │   │  │
 │  │   │ (Port 80 / 443)  │    │ (t3.micro Engine)│   │  │
 │  │   └──────────────────┘    └──────────────────┘   │  │
 │  └──────────────────────────────────────────────────┘  │
 └──────────────────────────┬─────────────────────────────┘
                            │
                            ▼
           ┌──────────────────────────────────┐
           │ Secure S3 Asset Block Namespace  │
           │ (AES256 Encrypted + Public Block)│
           └──────────────────────────────────┘
```

---

## 📦 Modular Component Breakdown

### 1. Network Component (`modules/network`)
Provisions isolated perimeter topologies, containing DNS route mappings and Internet Gateways to properly map cloud system communications without default default-route cross-exposure risks.

### 2. Compute & Storage Component (`modules/compute`)
Deploys scalable infrastructure components:
*   **EC2 Runtime Configuration:** Tied strictly onto `t3.micro` instances containing encrypted underlying `gp3` storage nodes.
*   **IMDSv2 Enforcement:** Token requirement hops are explicitly set to mandatory, neutralizing server-side request forgery (SSRF) security threats.
*   **S3 Hardening Layer:** Blocks public asset access structures globally, applying forced server-side encryption arrays using `AES256`.

---

## ⚙️ Configuration & Inputs

### `variables.tf` (Root Customization Matrix)

| Variable Identity | Data Type | Default Value | Description |
| :--- | :--- | :--- | :--- |
| `aws_region` | `string` | `"us-east-1"` | Targeted geographical deployment zone. |
| `ubuntu_ami_id` | `string` | `"ami-0c7217cdde317cfec"` | Verified canonical Ubuntu Minimal LTS image pointer. |
| `project_suffix` | `string` | `"prod-99431"` | Alphanumeric salt used to prevent namespace collisions. |

### `outputs.tf` (State Information Delivery)

*   `isolated_vpc_id`: Tracking identifier assigned to the created private cloud architecture network.
*   `compute_target_public_ip`: Ephemeral IPv4 access endpoint interface for user application mapping.
*   `secure_storage_bucket_domain`: FQDN (Fully Qualified Domain Name) allocated to secure S3 bucket spaces.

---

## 🛠️ Execution & Deployment Guide

### 📋 Prerequisites
*   [Terraform CLI v1.5.0+](https://hashicorp.com)
*   An active [AWS Account](https://amazon.com) with configured CLI profile credentials (`~/.aws/credentials`).

### 💥 Deployment Commands

1.  **Initialize the Workspace:**
    Download the HashiCorp cloud providers and initialize the modular local backend structures.
    ```bash
    terraform init
    ```

2.  **Validate Layout Security Integrity:**
    Perform code sanity analysis and structure evaluations.
    ```bash
    terraform validate
    ```

3.  **Generate Execution Forecast (Plan Output):**
    Preview the changes before applying them to your live AWS account.
    ```bash
    terraform plan -out=deployment.tfplan
    ```

4.  **Apply Architecture Infrastructure State:**
    Execute the plan to build the infrastructure in the cloud.
    ```bash
    terraform apply "deployment.tfplan"
    ```

5.  **Tear Down Infrastructure:**
    To destroy all created resources and avoid unexpected AWS charges:
    ```bash
    terraform destroy
    ```
