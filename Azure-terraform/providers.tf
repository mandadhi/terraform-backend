terraform {

  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "logicappstoragetf"
    container_name       = "terraform"
    key                  = "terraform.tfstate"

  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}