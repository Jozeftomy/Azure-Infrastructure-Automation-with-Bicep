param location string
param name string




resource sa 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
