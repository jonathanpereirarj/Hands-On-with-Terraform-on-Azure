terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "My-Test-Work"

    workspaces {
      name = "Pluralsight-HandsOn"
    }
  }
}

## PROVIDER

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

## RESOURCE

resource "azurerm_resource_group" "rg" {
  name     = "813-f060a93a-hands-on-with-terraform-on-azure"
  location = "eastus"
}

## VARIABLE

variable "ARM_TENANT_ID" {
  type = string
  default = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
}

## MODULE

module "testModule" {
  source               = "app.terraform.io/My-Test-Work/testModule/azurerm"
  version              = "1.0.0"
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "06082025stgactname"
}