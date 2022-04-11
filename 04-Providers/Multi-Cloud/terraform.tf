terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.40, <=2.97"
    }

     aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
