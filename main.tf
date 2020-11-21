
terraform {
  backend "azurerm" {
    resource_group_name  = "RG-storage"
    storage_account_name = "stacadritemp"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source="hashicorp/azurerm" 
      version = "~> 2.37.0"
    }
    azuread = {
      source="hashicorp/azuread" 
      version = "~> 1.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id #ARM_SUBSCRIPTION_ID
  tenant_id       = var.tenant_id #ARM_TENANT_ID Environment Variable.
  client_id       = var.client_id #ARM_CLIENT_ID Environment Variable.
  client_secret   = var.client_secret
}

provider "azuread" {
  features {}
}


