terraform {
  required_version = ">= 0.12"
  
  backend "azurerm" {
    environment = "public"
  }
}

provider "azurerm" {
  version = "=1.40.0"
}

provider "azuread" {
  version = "=0.7.0"
}

variable "name_prefix"       { }
variable "name_base"         { }
variable "name_suffix"       { }
variable "location"          { }
variable "node_count"        { }
variable "aks_version"       { }

locals {
  base_name  = "${var.name_prefix}-${var.name_base}-${var.name_suffix}"
  clean_name = "${var.name_prefix}${var.name_base}${var.name_suffix}"
}

resource "azurerm_resource_group" "group" {
  name     = local.base_name
  location = var.location
}