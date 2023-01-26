# Deploying Game Server Hosts with VMSS

## Table of Contents

- [Scenario Details](#scenario-details)

## Scenario Details

### Overview

This scenario is meant for customers who want to deploy Game Server Hosts using Virtual Machine Scale Sets. This solution deploys Virtual Machine Scale Sets in a Spoke Virtual Network that will peer back to your Hub Virtual Network. Public IP addresses are configured for each VMSS instance to allow for external access to the Game Server Hosts. Network Security Groups will be created to control inbound and outbound traffic from your VMSS instances.

### Naming

The following naming convention is used for resources deployed in this scenario: 