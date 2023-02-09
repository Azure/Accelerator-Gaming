# Game Server Hosting Accelerator with Terraform Guide

This guide is designed to help you get started with deploying Game Server Hosts using the provided Terraform template(s) within this repository. Before you deploy, it is recommended to review the template(s) to understand the resources that will be deployed and the associated costs.

This accelerator is to be used as starter kit and you can expand its functionality by developing your own deployments. This scenario deploys a new Game Server Host workload, so it cannot be used to maintain, modify or add resources to an existing or already deployed Game Server Host workload from this accelerator.

## Terraform Folder Structure

This folder is laid out hierarchically so that different levels of modules may be used as needed for your purpose. A summary of each level of the folder structure follows.

| Folder Name | Description |
| --- | --- |
| [Azure Kubernetes Service](./AKS) | This folder contains modules to deploy Game Servers using AKS. Modules include Networking, Insights, and AKS |
## Deployment Steps

1. Clone this repository onto the machine that will be used for development. *(Prerequisite: Ensure Terraform is installed and setup on your build machine prior to completing the next steps.*
1. Modify the `terraform.tfvars.sample` file to define values configured as variables within the module and file name local.tfvars extension if using this module as a root module.
1. If using a module in a custom module you can also copy the modules being used into that modules Terraform implementation.
1. Before deploying, confirm the correct subscription is selected using the following command:

    ```
    az account show
    ```

1. Change directory to the root Terraform module folder for your deployment

1. Run `terraform init` to initialize this directory
1. Run `terraform plan --var-file local.tfvars --out plan.out` to view the planned deployment
1. Run `terraform apply plan.out && terraform show` to confirm the deployment

## Additional References

<details>

<summary>Click to expand</summary>

- [Terraform Download](https://www.terraform.io/downloads.html)
- [Visual Code Download](https://code.visualstudio.com/Download)
- [Powershell VS Code Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- [HashiCorp Terraform VS Code Extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)
- [Azure Terraform VS Code Extension Name](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azureterraform)
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli-windows?tabs=azure-cli)
- [Configure the Azure Terraform Visual Studio Code extension](https://learn.microsoft.com/azure/developer/terraform/configure-vs-code-extension-for-terraform?tabs=azure-cli)

</details>

## Confirming Deployment

Once the deployment has completed it is important to check that the deployment succeeded and the resources are showing in the portal.

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. We would welcome you to open issues using GitHub [issues](https://github.com/Azure/Accelerator-Gaming/issues) to collaborate and improve these tools.
