resource "azurerm_application_insights" "appInsights" {
  name                = "${local.base_name}-apm"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  application_type    = "web"
}

output "instrumentation_key" {
  value = "${azurerm_application_insights.appInsights.instrumentation_key}"
}
