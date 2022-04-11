variable "project-name" { 
  default = "Terraform-demo"
}

locals { 
  default_frontend_name = "${join("-", tolist([var.project-name, "myresource"]))}"
}

locals { 
  some_tags = { 
    Owner = "DevOps Team"
    Project = "Initial Demo Project"
    Server  = "Backend"
    Name    = local.default_frontend_name
  }
}


# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = local.default_frontend_name
  location = "eastus"

  tags = local.some_tags
}



# Network Configuation
resource "azurerm_virtual_network" "example_rg" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example_rg" {
  name                = "example-nic"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = azurerm_public_ip.examplepublicip.id
  }
}



# Public IP Configuration 

resource "azurerm_public_ip" "examplepublicip" {
  name                = "myPublicIP"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg" {
  name                = "myNetworkSecurityGroup"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
}


resource "azurerm_network_security_rule" "testrules" {
  for_each                   = local.nsgrules
  name                       = each.key
  priority                   = each.value.priority
  direction                  = each.value.direction
  access                     = each.value.access
  protocol                   = each.value.protocol
  source_port_range          = each.value.source_port_range
  destination_port_range     = each.value.destination_port_range
  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix
  resource_group_name        = azurerm_resource_group.example_rg.name
  network_security_group_name     = azurerm_network_security_group.examplensg.name
}




# Virtual Machine

resource "azurerm_virtual_machine" "example_rg" {
  name                  = "example-vm"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg.id]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}
