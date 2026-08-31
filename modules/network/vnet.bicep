@description('Virtual Network name')
param name string

@description('Deployment location')
param location string

@description('Address prefixes for the VNET')
param addressPrefixes array

@description('Subnets to create')
param subnets array

resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: name
  location: location

  properties: {
    addressSpace: {
      addressPrefixes: addressPrefixes
    }

    subnets: [
      for s in subnets: {
        name: s.name
        properties: {
          addressPrefix: s.addressPrefix
        }
      }
    ]
  }
}
