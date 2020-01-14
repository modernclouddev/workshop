resource "kubernetes_namespace" "namespace" {

  metadata {
    name = "hackfest"
  }
}

resource "kubernetes_secret" "secret" {
  
  metadata {
    name = "cosmos-db-secret"
    namespace = "hackfest"
  }

  data = {
    user        = azurerm_cosmosdb_account.cosmos.name
    pwd         = azurerm_cosmosdb_account.cosmos.primary_master_key
    appinsights = "InstrumentationKey=${azurerm_application_insights.appInsights.instrumentation_key}"
  }

  type = "Opaque"
}