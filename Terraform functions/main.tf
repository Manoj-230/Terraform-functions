terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "newrg" {
  name     = join("",["${var.prefix}"],["RG01"])
  location = "West Europe"
}
resource "azurerm_storage_account" "newsa" {
  name                     = lower( join("",["${var.prefix}"],["SA01"]) )
  resource_group_name      = azurerm_resource_group.newrg.name
  location                 = azurerm_resource_group.newrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS" 
}
output "rgname"{
  value = join("",["${var.prefix}"],["RG01"])
}
output "saname"{
  value = lower( join("",["${var.prefix}"],["SA01"]) )
}