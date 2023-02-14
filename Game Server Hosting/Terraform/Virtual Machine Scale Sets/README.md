# Deploying Game Server Hosts with VMSS

## Table of Contents

- [Scenario Details](#scenario-details)
- [Prerequisites](#prerequisites)
- [Implementation](#implementation)
- [Deployment Steps](#deployment-steps)
- [Reporting Issues](#reporting-issues)

## Scenario Details

### Overview

This guide is designed to help you get started with deploying Game Server Hosts using the provided Terraform template(s) within this repository. Before you deploy, it is recommended to review the template(s) to understand the resources that will be deployed and how they are configured.

This accelerator is to be used as starter kit and you can expand its functionality by developing your own deployments. This scenario deploys a new Game Server Host workload, so it cannot be used to maintain, modify or add resources to an existing or already deployed Game Server Host workload from this accelerator.

### Game Server Hosts Architecture

This scenario deploys Game Server Hosts using Virtual Machine Scale Sets in a Spoke Virtual Network. This solution deploys a new:

- Spoke Network resources
  - Virtual Network
    - Subnet
    - Public IP Addresses
    - Network Security Group

- Game Server Host resources
  - Three Virtual Machine Scale Sets
    - Two Instances per Scale Set
    - Deployed into multiple zones
    - Marketplace Image

The Virtual Machine Scale Set Baseline Terraform files are all written as individual files each having a specific function. Variables have been created in all files for consistency, all changes to defaults are to be changed from the terraform.tfvars.sample file. In addition, module for network resources is in its own folder.

## Prerequisites

- Current version of the [Azure CLI](/<https://learn.microsoft.com/cli/azure/install-azure-cli)>
- Current version of the Terraform CLI
- An Azure Subscription(s) where you or an identity you manage has `Owner` [RBAC permissions](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#owner)
- Ensure Encryption at Host feature is already enabled on the subscription. To enable: az feature register --name EncryptionAtHost  --namespace Microsoft.Compute. To validate: az feature show --name EncryptionAtHost --namespace Microsoft.Compute

### Naming

Resource naming is configured by pre set resource abbreviation and variables. Pick a unique resource prefix that is between 1-4 alphanumeric characters in length without white spaces.

### Assumptions

There will be an existing Hub Virtual Network with either a Gateway with access to on-prem and/or Bastion host deployed in accordance with [Cloud Adoption Framework](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/).

## Implementation

## Deployment Steps

1. Modify the `terraform.tfvars` file to define the desired names, location, networking, and other variables
2. Before deploying, confirm the correct subscription
3. Change directory to the Terraform folder
4. Run `terraform init` to initialize this directory
5. Run `terraform plan` to view the planned deployment
6. Run `terraform apply` to confirm the deployment

[(Back to top)](#table-of-contents)

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. However, we would like to welcome you to open issues using GitHub [issues](https://github.com/Azure/avdaccelerator/issues) to collaborate and improve these tools.
