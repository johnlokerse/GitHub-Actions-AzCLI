[string] $rgName = "rg-githubactions-demo"
[string] $sku = "B1"
[string] $location = "westeurope"

try {
    # Create resource group
    az group create --location $location --resource-group $rgName

    # Create AppService
    [string] $appServiceName = "appservice-euw-githubactionsdemo"
    az appservice plan create --location $location --name $appServiceName --resource-group $rgName --sku $sku

    # Create WebApp
    [string] $webAppName = "webapp-euw-githubactionsdemo"
    az webapp create --name $webAppName --resource-group $rgName --plan $appServiceName

    az webapp deployment source config-zip --src .\projectoutput.zip --resource-group $rgName --name $webAppName    
}
catch {
    az group delete --resource-group $rgName --yes
}