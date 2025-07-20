terraform {
  backend "azurerm" {
    resource_group_name  = "MyDashboardProj1"
    storage_account_name = "tfstateprojstorage123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
