# Game Server Hosting with AKS

## Table of Contents

- Prerequisties
- Planning
- Spoke Network
- AKS Deployment

## Prerequisites

- Current version of Azure CLI
- Current version of Terraform CLI
- Azure Subscription(s) where you or an identity you manage has `Owner` [RBAC permissions](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#owner)

## Spoke Network

- New Virtual Network and Subnet
- Network Security Group
- Peering to existing Hub Vnet to new Spoke Vnet

### Files

The Game Server Hosting with AKS Terraform files are all written as individual files each having a specific function. Variables have been created in all files for consistency, all changes to defaults are to be changed from the terraform.tfvars.sample file. The structure is as follows:
| file Name                  | Description                                                  |
| ---------------------------| ------------------------------------------------------------ |
| data.tf                    | This file has data lookup |
| outputs.tf                  | This will contains the outputs post deployment |
| rg.tf                      | Creates the resource groups |
| main.tf                    | This file contains the Terraform provider settings and version |
| nsg.tf                     | Creates the network security group with required URLs |
| variables.tf               | Variables have been created in all files for various properties and names |
| vnet.tf                    | Creates the AKS spoke virtual network, subnet and peering to the hub network |
| terraform.tfvars.sample    | This file contains the values for the variables change per your requirements |

Validated on provider versions:

- hashicorp azurerm v3.35.0
