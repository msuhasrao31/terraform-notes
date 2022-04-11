variable "my_loc" { 
  description = "My Resources Location"
  default = "eastus" 
}


variable "my_vm_count" { 
  description = "My Instance Count"
  default = 2
}

variable "my_rg_name" { 
  default = "TestRG" 
}


variable "admin_username" { 
 type = string 
 default = "testadmin"
}

variable "admin_password" { 
 type = string 
 default = "Pass@word@432!"
}



variable "managed_disk_type" {
  type = map
  default = { 
    westus = "Premium_LRS"
    eastus = "Standard_LRS"
  }

}


variable "vm_size" { 
  type = string 
  default = "Standard_B1s"
}
