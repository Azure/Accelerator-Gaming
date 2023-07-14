targetScope = 'subscription'

param location string
param namePrefix string
param tags object

var resourceGroupName = 'rg-insights-${namePrefix}-${location}'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

module logging 'logging.bicep' = {
  name: 'logging'
  scope: resourceGroup
  params: {
    tags: tags
    location: location
    namePrefix: namePrefix
  }
  dependsOn: [
    resourceGroup
  ]
}

output loggingWorkspaceId string = logging.outputs.workspaceId
