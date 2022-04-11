provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "frontend" {
  count    = 1
  name     = "Green-RG-${count.index + 1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps Team"
    Project = "Terraform Automation"
  }

 lifecycle { 
   create_before_destroy = true 
 }


}

