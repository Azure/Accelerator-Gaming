# Azure Gaming Landing Zone Accelerator

## Overview

Enterprise-scale is an architectural approach and a reference implementation that enables effective construction and operation of landing zones on Azure, at scale. This approach aligns with the Azure road map and the Cloud Adoption Framework for Azure.

The Azure Gaming Landing Zone Accelerator only addresses what gets deployed in the specific subscriptions, highlighted by the red boxes in the [architectural diagram below](#architectural-diagram). It is assumed that an appropriate platform foundation is already setup which may or may not be the official [ALZ platform foundation](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/enterprise-scale/implementation#reference-implementation). This means that policies and governance should already be in place or should be set up after this implementation and are not a part of the scope this program. The policies applied to management groups in the hierarchy above the subscription will trickle down to the Enterprise-scale for AVD landing zone subscriptions.

## This Repository

In this repository, you get access to various customer scenarios that can help accelerate the development and deployment of Azure Gaming scenarios that conform with best practices and guidelines. Each scenario aims to represent common customer experiences with the goal of accelerating the process of developing and deploying conforming Azure Gaming scenarios using IaC as well as providing a step-by-step learning experience.

## Scenarios

### [Game Server Hosting](/Game%20Server%20Hosting/)

This scenario deploys Game Server Hosts using Azure Kubernetes Service in a Spoke Virtual Network. the automation will deploy a new spoke network with Azure Kubernetes cluster and a node pools. The automation will also deploy a Log Analytics workspace and a Log Analytics solution. The Nodes will be assigned to a dedicated host group and each node will be assigned its own Public IP address.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. However, we would like to welcome you to open issues using GitHub [issues](https://github.com/Azure/Accelerator-Gaming/issues) to collaborate and improve these tools.
