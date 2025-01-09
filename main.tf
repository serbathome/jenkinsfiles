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

resource "azurerm_service_plan" "service_plan" {
  name = random_string.random.result
  location = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "web_app" {
  name = random_string.random.result
  location = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  service_plan_id = azurerm_service_plan.service_plan.id
  site_config {
    
  }
}