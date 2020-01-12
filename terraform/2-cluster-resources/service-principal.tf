// Read more about why we're doing this
// https://github.com/terraform-providers/terraform-provider-azurerm/issues/2159

provider "random" {
  version = "2.2.1"
}

# Generate random string to be used as service principal password
resource "random_string" "password" {
  length  = 32
  special = true
}

# Create Azure AD Application for Service Principal
resource "azuread_application" "aks" {
  name = "${local.base_name}-sp"
}

# Create Service Principal
resource "azuread_service_principal" "aks" {
  application_id = azuread_application.aks.application_id
}

# Create Service Principal password
resource "azuread_service_principal_password" "aks" {
  end_date             = "2299-12-30T23:00:00Z"                        # Forever
  service_principal_id = azuread_service_principal.aks.id
  value                = random_string.password.result
}