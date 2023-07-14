targetScope = 'subscription'

param location string
param tags object
param namePrefix string

var spokeRGName = 'rg-net-aks-${namePrefix}-${location}'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: spokeRGName
  location: location
  tags: tags
}
