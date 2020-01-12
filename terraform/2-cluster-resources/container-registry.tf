resource "azurerm_container_registry" "acr" {
  name                = "${local.clean_name}acr"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr-assignment" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azuread_service_principal.aks.id

  depends_on = [
    azuread_application.aks
  ]
}