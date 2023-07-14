targetScope = 'resourceGroup'

param location string
param namePrefix string
param tags object
param clusterCount int = 1
param dhSku string = 'FSv2-Type4'

var hostGroupNamePrefix = 'dh-aks-${namePrefix}-${location}-'
var dedicatedHostGroupName = 'dhg-aks-${namePrefix}-${location}'
var uamiName = 'uai-aks-${namePrefix}-${location}'

resource dedicatedHostGroup 'Microsoft.Compute/hostGroups@2023-03-01' = {
  name: dedicatedHostGroupName
  location: location
  tags: tags
  properties: {
    platformFaultDomainCount: 2
    supportAutomaticPlacement: true
  }
}

resource dedicatedHost 'Microsoft.Compute/hostGroups/hosts@2023-03-01' = [for i in range(0, clusterCount): {
  name: '${hostGroupNamePrefix}${i}'
  location: location
  tags: tags
  parent: dedicatedHostGroup
  sku: {
    name: dhSku
    capacity: 1
    tier: 'Standard'
  }
  properties: {
    platformFaultDomain: 1
    autoReplaceOnFailure: true
  }
}]

resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: uamiName
  location: location
  tags: tags
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: '7b72ccfa-538f-45e7-811a-b87dc5129017'
  properties: {
    principalId: userAssignedIdentity.properties.principalId
    // contributor role definition
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c')
  }
}

output dedicatedHostGroupResourceId string = dedicatedHostGroup.id
output userAssignedIdentityResourceId string = userAssignedIdentity.id
