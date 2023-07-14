targetScope = 'resourceGroup'

param localVNETId string
param remoteVNETId string

resource virtualNetworksLocal 'Microsoft.Network/virtualNetworks@2023-02-01' existing = {
  name: split(localVNETId, '/')[8]
}

resource virtualNetworkPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-02-01' = {
  name: 'peer-to-${virtualNetworksLocal.name}'
  parent: virtualNetworksLocal
  properties: {
    allowForwardedTraffic: false
    allowGatewayTransit: false
    allowVirtualNetworkAccess: true
    remoteVirtualNetwork: {
      id: remoteVNETId
    }
  }
}
