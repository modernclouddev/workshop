resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "${local.base_name}-db"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
  }
  
  geo_location {
    prefix            = "${local.base_name}-dbgeo"
    location          = azurerm_resource_group.group.location
    failover_priority = 0
  }
}

output "mongodb_endpoint" {
  value = "${azurerm_cosmosdb_account.cosmos.endpoint}"
}

output "mongodb_user" {
  value = "${azurerm_cosmosdb_account.cosmos.name}"
}

output "mongodb_password" {
  value = "${azurerm_cosmosdb_account.cosmos.primary_master_key}"
}