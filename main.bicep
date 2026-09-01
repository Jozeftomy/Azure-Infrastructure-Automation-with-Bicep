param location string

param vnet object

param nsg object

param storageAccountName string

var nsgAttachments =[
  {
    vnetName: vnet.name
    subnetName: vnet.subnets[0].name
    addressPrefix: vnet.subnets[0].addressPrefix
  }
  {
    vnetName: vnet.name
    subnetName: vnet.subnets[1].name
    addressPrefix: vnet.subnets[1].addressPrefix
  }
]

module devnet 'modules/network/vnet.bicep' = {
  name: 'dev-network'

  params: {
    name: vnet.name
    location: location
    addressPrefixes: vnet.addressPrefixes
    subnets: vnet.subnets
  }
}

module devstorage 'modules/storage/storageAccount.bicep' = {
  name: 'dev-storage'
  params: {
    name: storageAccountName
    location: location
  }
}

module devnsg 'modules/security/nsg.bicep' = {
  name: 'shared-nsg'
  params: {
    location: location
    name: nsg.name
    rules: nsg.rules
    attachments: nsgAttachments
    
  }
}
