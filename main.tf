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

# Existing resource group (manually created)
resource "azurerm_resource_group" "existing_rg" {
  name     = "MyDashboardProj"
  location = "East US"
}

# Resource group managed by Terraform
resource "azurerm_resource_group" "my_resourcegroup" {
  name     = "MyDashboardProj1"
  location = "East US"

  tags = {
    environment = "dev"
    source      = "Terraform"
    owner       = "anu"
  }
}

resource "azurerm_storage_account" "tfstate_storage" {
  name                     = "tfstateprojstorage123" # must be globally unique and lowercase
  resource_group_name      = azurerm_resource_group.my_resourcegroup.name
  location                 = azurerm_resource_group.my_resourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}


resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate_storage.name
  container_access_type = "private"
}