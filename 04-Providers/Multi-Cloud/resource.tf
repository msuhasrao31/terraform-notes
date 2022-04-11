#Azure Code Block -  Create a Resource Group
resource "azurerm_resource_group" "example" {
  count    = 1
  name     = "Blue-RG-${count.index + 1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps Team"
    Project = "Terraform Automation"
  }

}

/*
# AWS Code Block 
resource "aws_instance" "web" {
  ami           = "ami-08b6f2a5c291246a0"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-Test-AV"
  }
}
*/
