param location string
param hubVirtualNetworkId string
param spokeVirtualNetworkAddressSpace string
param spokeVirtualNetworkSubnetAddressPrefix string
param tags object = {}
param namePrefix string
// dedicated host pool and AKS parameters
param clusterCount int = 2
param dedicatedHostPoolSku string = 'FSv2-Type4'

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
    clusterCount: clusterCount
    defaultNodePublicIPPrefixResourceId: network.outputs.defaultNodePublicIPPrefixResourceId
    nodePoolPublicIPPrefixResourceId: network.outputs.nodePublicIPPrefixResourceId
    spokeVnetSubnetId: network.outputs.spokeVnetSubnetId
    logAnalyticsWorkspaceResourceId: insights.outputs.loggingWorkspaceId
    dhSku: dedicatedHostPoolSku
  }
}
