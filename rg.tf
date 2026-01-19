terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

########################
# Variables
########################
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-terraform-demo"
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Tags to apply to the Resource Group"
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

########################
# Resource Group
########################
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

########################
# Outputs
########################
output "resource_group_id" {
  description = "The ID of the created Resource Group"
  value       = azurerm_resource_group.this.id
}

output "resource_group_name" {
  description = "The name of the created Resource Group"
  value       = azurerm_resource_group.this.name
}
