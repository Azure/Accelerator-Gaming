# Deploying Game Server Hosts with Azure Kubernetes Services

## Table of Contents

- [Scenario Details](#scenario-details)
- [Prerequisites](#prerequisites)
- [Implementation Steps](#implementation-steps)
- [Deployment Steps](#deployment-steps)
- [Reporting Issues](#reporting-issues)

## Scenario Details

### Overview

This guide is designed to help you get started with deploying Game Server Hosts using the provided Terraform template(s) within this repository. Before you deploy, it is recommended to review the template(s) to understand the resources that will be deployed and how they are configured.

This accelerator is to be used as starter kit and you can expand its functionality by developing your own deployments. This scenario deploys a new Game Server Host, so it cannot be used to maintain, modify or add resources to an existing or already deployed Game Server Host workload from this accelerator.

### Game Server Host Architecture

This scenario deploys Game Server Hosts using Azure Kubernetes Service in a Spoke Virtual Network. This solution deploys a new:

#### Spoke Network resources

- Virtual Network
  - Subnet
  - Public IP Addresses
  - Network Security Group

#### Game Server Host resources

- AKS Clusters
  - Default Node Pool
  - Node Pools
  
- Dedicated Host Groups
  - Dedicated Hosts
  - User Assigned Identity
  - Role Assignment

#### Insights

- Log Analytic Workspace
  - Log Analytic Solution

### Terraform File Structure

| Module | Description |
| -- | -- |
| aks.tf |  This file creates your Kubernetes Cluster and Node Pools |
| dhg.tf |  This file creates your Dedicated Host Groups for your Kubernetes Node Pools |
| rg.tf |  This file creates your Resource Group |
| vnet.tf |  This file creates your Virtual Network and Subnets |
| aks/main.tf | This file contains the provider for AKS folder |
| insights.tf | This file creates your Log Analytics Workspace and Solution |
| variables.tf | This file contains the variables for the deployment |
| outputs.tf | This file contains the outputs for the post deployment |
| data.tf | This file has the data lookup |
| vnet.tf | This file creates your Virtual Network and Subnets |
| nsg.tf | This file creates your Network Security Groups |
| network/main.tf | This file contains the provider for Network folder |
| main.tf | Will have the individual modules for aks, insights and network |
| terraform.tfvars.sample | this file contains the values for the variables change per your requirements |

### Planning

- Resource naming is configured by pre set resource abbreviation and variables. Pick a unique resource prefix that is between 1-4 alphanumeric characters in length without white spaces. This prefix will be used for all resources created by this accelerator.
- Discuss a maintenance window before deploying the solution. Is set to 'allowed' by default. Set a day when you want maintenance to occur on and how many hours you want the window to be opened. The window will be opened at 1am and will run for how long you select the hours.
- Native scaling solution with AKS may not be an ideal option for this type of scenario. Auto Scaling through AKS is not enabled for this solution. If you do not have your own scaling solution then check out [Thundernetes](https://playfab.github.io/thundernetes/).

### Assumptions

There will be an existing Hub Virtual Network with either a Gateway with access to on-prem and/or Bastion host deployed in accordance with [Cloud Adoption Framework](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/landing-zone/).

## Prerequisites

- Current version of the [Azure CLI](/cli/azure/install-azure-cli)
- Current version of the Terraform CLI
- An Azure Subscription(s) where you or an identity you manage has `Owner` [RBAC permissions](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles#owner)
- Ensure Encryption at Host feature is already enabled on the subscription. To enable: az feature register --name EncryptionAtHost  --namespace Microsoft.Compute. To validate: az feature show --name EncryptionAtHost --namespace Microsoft.Compute

## Implementation Steps

1. Clone your repo with the following git command:

```bash
  git clone <https://github.com/Azure/accelerator-gaming.git>
```  

2. Change your terminal into that new subdirectory:

```bash
  cd Accelerator-Gaming/Game Server Hosting/Terraform/Azure Kubernetes Service
  az account list --output table
  az account set --subscription 'Your subscription ID'
```

3. Rename terraform.tfvars.example

4. Set configuration variables:

- resource_location = "Your Azure Region"
- resource_tags = "Your Tags"
- Prefix = "Your Prefix"
- rg_hub = "Your Hub Resource Group Name"
- hub_vnet_name = "Your Hub Virtual Network Name"
- spoke_vnet_address_space = ["Your Spoke Virtual Network Address Space"]
- subnet_address_prefix = ["Your Subnet Address Space for your node pool"]
- spoke_subscription_id = "Your spoke subscription ID"
- hub_subscription_id = "Your hub subscription ID"
- aks_dns_prefix = "Your AKS DNS Prefix"
- k8s_version = "Kubernetes Version you want to set"
- os_sku = "Chose the OS Sku you want to use"
- cluster_count = "Chose the number of AKS clusters you want to be created"
- dh_sku_name = "Chose the Dedicated Host SKU you want to use, must be the sku you are going to use for your AKS nodes. Must be in dedicated host group format"
- node_pool_vm_size = "Chose the VM Size you want to use for your AKS nodes, should be the same as your Dedicated Host SKU"
- node_pool_count = "Chose the number of node pools you want to be created in the cluster"
- node_count = "Chose the number of nodes you want to be created in the node pool"

## Deployment Steps

1. Rename the `terraform.tfvars.sample` file to `local.tfvars` and update the variables with your values
1. Modify the `local.tfvars` file to define the desired names, location, networking, and other variables
1. Before deploying, confirm the correct subscription
1. Change directory to the Terraform folder
1. Run `terraform init` to initialize this directory
1. Run `terraform plan --var-file local.tfvars --plan.out` to view the planned deployment
1. Run `terraform apply plan.out && terraform show` to confirm the deployment

[(Back to top)](#table-of-contents)

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. However, we would like to welcome you to open issues using GitHub [issues](https://github.com/Azure/avdaccelerator/issues) to collaborate and improve these tools.
