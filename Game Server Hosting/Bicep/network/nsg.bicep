param location string
param namePrefix string
param tags object

var nsgName = 'nsg-aks-${namePrefix}-${location}'

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-02-01' = {
  name: nsgName
  tags: tags
  location: location
  properties: {
    securityRules: [
      {
        name: 'allow-rdp'
        properties: {
          priority: 100
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: 'VirtualNetwork'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '3389'
        }
      }
    ]
  }
}

output resourceId string = networkSecurityGroup.id
