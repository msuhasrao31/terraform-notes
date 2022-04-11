output "RG_Name" { 
 value = azurerm_resource_group.example.*.name
}




output "RG_ID" { 
 value = azurerm_resource_group.example.*.id
}
