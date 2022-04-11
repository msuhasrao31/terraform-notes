# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "${var.my_rg_name}"
  location = var.my_loc
 
  tags = {
    Owner = "AV"
   }
}


# Network Configuation
## Virtual Network
resource "azurerm_virtual_network" "example_rg" {
  name                = "${var.my_rg_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}


## SubNet 
resource "azurerm_subnet" "internal" {
  name                 = "${var.my_rg_name}-internal"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_subnet" "external" {
  name                 = "${var.my_rg_name}-external"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.7.0/24"]
}


## Network Interface 
resource "azurerm_network_interface" "example_rg" {
  count               = var.my_vm_count
  name                = "${var.my_rg_name}-example-nic-${count.index}"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration1-${count.index}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id  = element(azurerm_public_ip.examplepublicip.*.id, count.index)
  }
}


# Public IP Configuration 
resource "azurerm_public_ip" "examplepublicip" {
    count 			= var.my_vm_count
    name                         = "myPublicIP-${count.index}"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.example_rg.name
    allocation_method            = "Dynamic"
}


# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg" {
    name                = "${var.my_rg_name}-nsg"
    location            = "eastus"
    resource_group_name = azurerm_resource_group.example_rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
