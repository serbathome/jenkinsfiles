terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "storage-account-resource-group"
    storage_account_name  = "32ksa8uf23ndshg"
    container_name        = "terraform-states"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
  # Configuration options
}

resource "random_string" "random" {
    length  = 16
    special = false
}

resource "azurerm_resource_group" "group" {
  name = random_string.random.result
  location = "East US"
}