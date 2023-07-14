param location string
param hubVirtualNetworkId string
param spokeVirtualNetworkAddressSpace string
param spokeVirtualNetworkSubnetAddressPrefix string
param tags object
param namePrefix string

var spokeRGName = 'rg-net-aks-${namePrefix}-${location}'
var spokeVirtualNetworkName = 'vnet-aks-${namePrefix}-${location}'
var spokeSubnetName = 'subnet-aks-${namePrefix}-${location}'
var pipPrefixNameDNP = 'pip-aks-dnp-${namePrefix}-${location}'
var pipPrefixNameNP = 'pip-aks-np-${namePrefix}-${location}'

module resourceGroup 'rg.bicep' = {
  name: spokeRGName
  scope: subscription()
  params: {
    namePrefix: namePrefix
    location: location
    tags: tags
  }

}

module networkSecurityGroup 'nsg.bicep' = {
  name: 'nsg'
  params: {
    location: location
    tags: tags
    namePrefix: namePrefix
  }
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: spokeVirtualNetworkName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        spokeVirtualNetworkAddressSpace
      ]
    }
    subnets: [
      {
        name: spokeSubnetName
        properties: {
          addressPrefix: spokeVirtualNetworkSubnetAddressPrefix
          networkSecurityGroup: {
            id: networkSecurityGroup.outputs.resourceId
          }
        }
      }
    ]
  }
}

resource publicIPPrefixDNP 'Microsoft.Network/publicIPPrefixes@2023-02-01' = {
  name: pipPrefixNameDNP
  location: location
  tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {
    prefixLength: 28

  }
}

resource publicIPPrefixNP 'Microsoft.Network/publicIPPrefixes@2023-02-01' = {
  name: pipPrefixNameNP
  location: location
  tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {
    prefixLength: 28
  }
}

module peeringHubToSpoke './peeringDeployment.bicep' = {
  name: 'peeringHubToSpoke'
  scope: subscription(split(hubVirtualNetworkId, '/')[2])
  params: {
    localVNETId: hubVirtualNetworkId
    remoteVNETId: virtualNetwork.id
  }
}

module peeringSpokeToHub './peeringDeployment.bicep' = {
  name: 'peeringSpokeToHub'
  scope: subscription()
  params: {
    localVNETId: virtualNetwork.id
    remoteVNETId: hubVirtualNetworkId
  }
}

output spokeVnetSubnetId string = virtualNetwork.properties.subnets[0].id
output defaultNodePublicIPPrefixResourceId string = publicIPPrefixDNP.id
output nodePublicIPPrefixResourceId string = publicIPPrefixNP.id
