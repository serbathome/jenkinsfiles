terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
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