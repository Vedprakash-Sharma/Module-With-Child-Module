terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.1"

    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }

  }

  #   backend "azurerm" {
  #   resource_group_name = "Backend-rg"
  #   storage_account_name = "storageveda"
  #   container_name = "vedacontainer01"
  #   key = "modual.tfstate"
  # }
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }
}
provider "random" {
  # Configuration options
}