param location string = 'eastus2'
param hubVirtualNetworkId string = '/subscriptions/c3803411-d6c0-474d-9200-4c197625f56d/resourceGroups/rg-core-eastus2/providers/Microsoft.Network/virtualNetworks/core-vnet-eastus2'
param spokeVirtualNetworkAddressSpace string = '172.16.0.0/24'
param spokeVirtualNetworkSubnetAddressPrefix string = '172.16.0.0/24'
param tags object = {}
param namePrefix string = 'gaacel'

module network 'network/main.bicep' = {
  name: 'network'
  params: {
    location: location
    hubVirtualNetworkId: hubVirtualNetworkId
    spokeVirtualNetworkAddressSpace: spokeVirtualNetworkAddressSpace
    spokeVirtualNetworkSubnetAddressPrefix: spokeVirtualNetworkSubnetAddressPrefix
    tags: tags
    namePrefix: namePrefix
  }
}

module insights 'insights/main.bicep' = {
  name: 'insights'
  scope: subscription()
  params: {
    location: location
    tags: tags
    namePrefix: namePrefix
  }
}

module aks 'aks/main.bicep' = {
  name: 'aks'
  scope: subscription()
  params: {
    location: location
    tags: tags
    namePrefix: namePrefix
    clusterCount: 2
    defaultNodePublicIPPrefixResourceId: network.outputs.defaultNodePublicIPPrefixResourceId
    nodePoolPublicIPPrefixResourceId: network.outputs.nodePublicIPPrefixResourceId
    spokeVnetSubnetId: network.outputs.spokeVnetSubnetId
    logAnalyticsWorkspaceResourceId: insights.outputs.loggingWorkspaceId
  }
}
