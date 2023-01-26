# Deploying Game Server Hosts with VMSS

## Table of Contents

- [Scenario Details](#scenario-details)

## Scenario Details

### Overview

This guide is designed to help you get started with deploying Game Server Hosts using the provided Terraform template(s) within this repository. Before you deploy, it is recommended to review the template(s) to understand the resources that will be deployed and the associated costs.

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
    - 2 Instances per Scale Set

The Virtual Machine Scale Set Baseline Terraform files are all written as individual files each having a specific function. Variables have been created in all files for consistency, all changes to defaults are to be changed from the terraform.tfvars.sample file. In addition, module for network resources is in its own folder. 

