resource "random_string" "webapprnd" {
  length  = 8
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "azurerm_resource_group" "RGtf_webapps" {
   name         = "RGtf_webapps"
   location     = var.loc
   tags         = var.tags
}

resource "azurerm_app_service_plan" "free" {
    name                = "plan-free-${var.loc}"
    location            = var.loc
    resource_group_name = azurerm_resource_group.RGtf_webapps.name
    tags                = azurerm_resource_group.RGtf_webapps.tags

    kind                = "Linux"
    reserved            = true
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_app_service" "cadri" {
    name                = "webapp-${random_string.webapprnd.result}-${var.loc}"
    location            = var.loc
    resource_group_name = azurerm_resource_group.RGtf_webapps.name
    tags                = azurerm_resource_group.RGtf_webapps.tags

    app_service_plan_id = azurerm_app_service_plan.free.id
}