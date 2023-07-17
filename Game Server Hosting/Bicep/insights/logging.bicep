targetScope = 'resourceGroup'

param location string
param namePrefix string
param tags object

var workspaceName = 'law-aks-${namePrefix}-${location}'

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: workspaceName
  location: location
  tags: tags
  properties: {
    retentionInDays: 30
    sku: {
      name: 'PerGB2018'
    }
  }
}

// FIX ME: Won't deploy - may be deprecated?
// resource solution 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
//   name: 'containerinsights'
//   location: location
//   tags: tags
//   plan: {
//     name: 'containerinsights'
//     product: 'OMSGallery/ContainerInsights'
//     publisher: 'Microsoft'
//     promotionCode: ''
//   }
//   properties: {
//     workspaceResourceId: workspace.id
//   }
// }

output workspaceId string = workspace.id
