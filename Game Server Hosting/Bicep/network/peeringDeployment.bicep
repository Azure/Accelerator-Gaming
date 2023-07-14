targetScope = 'subscription'

param localVNETId string
param remoteVNETId string

module vnetPeering './peering.bicep' = {
  name: 'vnetPeering'
  scope: resourceGroup(split(localVNETId, '/')[4])
  params: {
    localVNETId: localVNETId
    remoteVNETId: remoteVNETId
  }
}

