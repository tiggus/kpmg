terraform {
    required_version = ">= 0.12.24"
    backend "azurerm" {
        resource_group_name  = "backendrg"
        storage_account_name = "storageacct"
        container_name       = "storagecontainer"
        key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
    version = "~>1.44"
}
