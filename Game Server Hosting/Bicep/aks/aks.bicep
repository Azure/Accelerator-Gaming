targetScope = 'resourceGroup'

param location string
param namePrefix string
param spokeVnetSubnetId string
param uamiId string
param hostGroupId string
param defaultNodePublicIPPrefixId string
param nodePoolPublicIPPrefixId string
param logAnalyticsWorkspaceId string
param clusterCount int = 2
param tags object

var aksNamePrefix = 'aks-${namePrefix}-${location}-'
var k8sVersion = '1.25.5'
var osSku = 'Ubuntu'
var poolVMSize = 'Standard_F4s_v2'
var poolNodeCount = 2
var nodePoolCount = 2

resource akscluster 'Microsoft.ContainerService/managedClusters@2023-05-02-preview' = [for i in range(0, clusterCount): {
  name: '${aksNamePrefix}${i}'
  location: location
  tags: tags
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${uamiId}': {}
    }
  }
  sku: {
    name: 'Standard'
    tier: 'Paid'
  }
  properties: {
    kubernetesVersion: k8sVersion
    dnsPrefix: '${aksNamePrefix}${i}'
    agentPoolProfiles: [
      {
        name: 'agentpool'
        tags: tags
        enableAutoScaling: false
        enableNodePublicIP: true
        count: poolNodeCount
        vmSize: poolVMSize
        osType: 'Linux'
        vnetSubnetID: spokeVnetSubnetId
        hostGroupID: hostGroupId
        osDiskType: 'Managed'
        scaleDownMode: 'Deallocate'
        nodePublicIPPrefixID: defaultNodePublicIPPrefixId
      }
    ]
    networkProfile: {
      networkPlugin: 'azure'
      networkPolicy: 'azure'
      loadBalancerSku: 'Standard'
    }
    addonProfiles: {
      omsagent: {
        enabled: true
        config: {
          logAnalyticsWorkspaceResourceID: logAnalyticsWorkspaceId
        }
      }
    }
  }
}]

resource maintenanceConfig 'Microsoft.ContainerService/managedClusters/maintenanceConfigurations@2023-05-02-preview' = [for i in range(0, clusterCount): {
  name: 'maintenanceConfig${i}'
  parent: akscluster[i]
  properties: {
    maintenanceWindow: {
      durationHours: 2
      schedule: {
        weekly: {
          dayOfWeek: 'Sunday'
          intervalWeeks: 1
        }
      }
      startTime: '03:00'
    }
  }
}]

resource nodePool 'Microsoft.ContainerService/managedClusters/agentPools@2023-05-02-preview' = [for i in range(0, nodePoolCount): {
  name: 'agentpool${i}'
  parent: akscluster[i]
  properties: {
    count: poolNodeCount
    vmSize: poolVMSize
    osType: 'Linux'
    osSKU: osSku
    vnetSubnetID: spokeVnetSubnetId
    hostGroupID: hostGroupId
    osDiskType: 'Managed'
    scaleDownMode: 'Deallocate'
    nodePublicIPPrefixID: nodePoolPublicIPPrefixId
    enableAutoScaling: false
    tags: tags
    enableNodePublicIP: true
  }
}]
