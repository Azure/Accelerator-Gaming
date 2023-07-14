targetScope = 'subscription'

param location string
param namePrefix string
param tags object
param defaultNodePublicIPPrefixResourceId string
param nodePoolPublicIPPrefixResourceId string
param logAnalyticsWorkspaceResourceId string
param spokeVnetSubnetId string
param clusterCount int

var resourceGroupNameAKS = 'rg-aks-${namePrefix}-${location}'
var resourceGroupNameIdentity = 'rg-identity-${namePrefix}-${location}'

resource resourceGroupAKS 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupNameAKS
  location: location
}

resource resourceGroupIdentity 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupNameIdentity
  location: location
}

module dedicatedHostGroup './hostGroup.bicep' = {
  name: 'dedicatedHostGroup'
  scope: resourceGroupAKS
  params: {
    location: location
    namePrefix: namePrefix
    tags: tags
  }
}

module aks 'aks.bicep' = {
  name: 'aks'
  scope: resourceGroupAKS
  params: {
    location: location
    namePrefix: namePrefix
    tags: tags
    hostGroupId: dedicatedHostGroup.outputs.dedicatedHostGroupResourceId
    uamiId: dedicatedHostGroup.outputs.userAssignedIdentityResourceId
    defaultNodePublicIPPrefixId: defaultNodePublicIPPrefixResourceId
    nodePoolPublicIPPrefixId: nodePoolPublicIPPrefixResourceId
    logAnalyticsWorkspaceId: logAnalyticsWorkspaceResourceId
    spokeVnetSubnetId: spokeVnetSubnetId
    clusterCount: clusterCount
  }
}
