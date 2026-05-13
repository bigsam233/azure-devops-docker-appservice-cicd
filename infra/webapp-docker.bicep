@description('Azure region')
param location string = resourceGroup().location

@description('Azure Container Registry login server')
param acrLoginServer string

@description('Docker image name')
param dockerImage string = 'eshoponweb/web:latest'

var appServicePlanName = 'asp-${uniqueString(resourceGroup().id)}'
var webAppName = 'app-${uniqueString(resourceGroup().id)}'

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
    size: 'B1'
    family: 'B'
    capacity: 1
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {
  name: webAppName
  location: location
  kind: 'app,linux,container'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOCKER|${acrLoginServer}/${dockerImage}'
      alwaysOn: true
      acrUseManagedIdentityCreds: true
    }
  }
}

resource webAppSettings 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: webApp
  name: 'appsettings'
  properties: {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE: 'false'
    DOCKER_REGISTRY_SERVER_URL: 'https://${acrLoginServer}'
    ASPNETCORE_ENVIRONMENT: 'Production'
  }
}

output webAppName string = webApp.name
output webAppPrincipalId string = webApp.identity.principalId
output webAppId string = webApp.id