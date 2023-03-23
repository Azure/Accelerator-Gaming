# Game Server Hosting

## Overview

Azure Landing Zone Accelerators are architectural guidance, reference architecture, reference implementations and automation packaged to deploy workload platforms on Azure at Scale and aligned with industry proven practices.

The Game Server Hosting accelerator represents the strategic design path and target technical state for Game Server Hosts deployment.

It is assumed that an appropriate platform foundation is already setup which may or may not be the official ESLZ platform foundation. This means that policies and governance should already be in place or should be setup after this implementation and are not a part of the scope this program. The policies applied to management groups in the hierarchy above the subscription will trickle down to the subscription and resources deployed in this accelerator.

## Game Server Host Deployment

Get started with deploying a Game Server Hosts using the provided Terraform or Bicep template(s) within this repository. Before you deploy, it is recommended to review the template(s) to understand the resources that will be deployed and how they are configured.

- Azure Kubernetes Resources: Two Clusters with Two Node Pools each and Dedicated Host Groups for the Node Pools
- Virtual Network: One Virtual Network with Two Subnets
- Log Analytics Workspace: One Log Analytics Workspace with One Log Analytics Solution

| Deployment Type | Link |
| :----------------------- | :---------------------------------: |
| Terraform | [![Terraform](./docs/icons/terraform.png)](./Terraform/) |
| Bicep     | [![Bicep](./docs/icons/bicep.png)](./Bicep/)             |

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit [https://cla.opensource.microsoft.com](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/legal/intellectualproperty/trademarks).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.

## Reporting issues

Microsoft Support is not yet handling issues for any published tools in this repository. However, we would like to welcome you to open issues using GitHub [issues](https://github.com/Azure/avdaccelerator/issues) to collaborate and improve these tools.
