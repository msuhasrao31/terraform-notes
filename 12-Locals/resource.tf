variable "project" { 
  default = "terraform" 
}

locals { 
  default_name = "${join("-", tolist([var.project, "RG"]))}"
}


locals { 
   some_tags = { 
     Owner = "DevOps Team" 
     Project = "Terraform Automation"
     Env    = "Production"
     Name  = local.default_name 

  }
}



# Create a Resource Group
resource "azurerm_resource_group" "blue" {
  name     = "${local.default_name}-blue"
  location = "eastus"
  tags    = local.some_tags
}


resource "azurerm_resource_group" "green" {
  name     = "${local.default_name}-green"
  location = "eastus"
  tags    = local.some_tags
}


resource "azurerm_resource_group" "orange" {
  name     = "${local.default_name}-orange"
  location = "eastus"
  tags    = local.some_tags
}

