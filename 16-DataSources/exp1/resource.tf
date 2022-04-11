# Create a resource group
resource "azurerm_resource_group" "frontend" {
  name     = "frontend-RG"
  location = "westus"
  tags = { 
     Owner = "DevOps Team" 
     Project = "Terraform Automation"
     Env    = "Production"
 }
}



data "azurerm_resources" "example" { 
  resource_group_name = "frontend-RG"
}



resource "azurerm_resource_group" "backend" {
  name     = "${data.azurerm_resources.example.id}-backend"
  location = "eastus"
  tags = { 
     Owner = "DevOps Team" 
     Project = "Terraform Automation"
     Env    = "Production"
 }
}

