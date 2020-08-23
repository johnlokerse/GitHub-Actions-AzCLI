rgName = "rg-githubactions-demo"
sku = "B1"
location = "westeurope"

{
    # Create resource group
    az group create --location $location --resource-group $rgName

    # Create AppService
    appServiceName = "appservice-euw-githubactionsdemo"
    az appservice plan create --location $location --name $appServiceName --resource-group $rgName --sku $sku

    # Create WebApp
    webAppName = "webapp-euw-githubactionsdemo"
    az webapp create --name $webAppName --resource-group $rgName --plan $appServiceName

    # Deploy ZIP
    az webapp deployment source config-zip --src .\projectoutput.zip --resource-group $rgName --name $webAppName    
}
|| {
    az group delete --resource-group $rgName --yes
}