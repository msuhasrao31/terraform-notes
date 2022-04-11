# Create a Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.my_rg_name
  location = var.my_loc

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps Team"
    Project = "Terraform Automation"
  }

}



