provider "azurerm" {
  features {}
  #  subscription_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_id = "xxxxxxxxxxxxxxxxxxxxxx"
  #  client_secret = "xxxxxxxxxxxxxxxxxxxxxx"
  #  tenant_id = "xxxxxxxxxxxxxxxxxxxxxx"

}

# Create a Resource Group
resource "azurerm_resource_group" "example" {
  name     = "Blue-RG"
  location = "eastus"
}


resource "azurerm_resource_group" "example2" {
  name     = "Green-RG"
  location = "eastus"
}

