# Get Resources from a Resource Group

data "azurerm_resources" "example" {
  resource_group_name = "example-resources-RG"
}


output "resourcedetails" { 
  value = data.azurerm_resources.example
}


data "azurerm_resources" "networkinterface" {
  resource_group_name = "example-resources-RG"
  type = "Microsoft.Network/networkInterfaces"
}


data "azurerm_resources" "vmname" {
  resource_group_name = "example-resources-RG"
  type = "Microsoft.Compute/virtualMachines"
}

output "networkinterface" { 
  value = data.azurerm_resources.networkinterface.resources.*.name
}



output "vmname" { 
 value = data.azurerm_resources.vmname.resources.*.name
}
