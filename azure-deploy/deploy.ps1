[string] $rgName = "rg-githubactions-demo"
[string] $sku = "D1"
[string] $location = "westeurope"

try {
    # Create resource group
    az group create --location $location --resource-group $rgName
}
catch {
    az group delete --resource-group $rgName --yes
}