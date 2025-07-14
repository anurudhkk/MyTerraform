terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "existing_rg" {
  name     = "MyDashboardProj"
  location = "East US"
}

resource "azurerm_resource_group" "my_resourcegroup" {
  name     = "MyDashboardProj1"
  location = "East US"

  tags = {
    environment = "dev"
    source      = "Terraform"
    owner       = "anu"
  }
}
