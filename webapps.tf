resource "random_string" "webapprnd" {
  length  = 8
  lower   = true
  number  = true
  upper   = false
  special = false
}

resource "azurerm_resource_group" "RGtf_webapps" {
  name     = "RGtf_webapps"
  location = var.loc
  tags     = var.tags
}

resource "azurerm_app_service_plan" "free" {
  count               = length(var.webapplocs)
  name                = "plan-free-${count.index}"
  location            = var.webapplocs[count.index]
  resource_group_name = azurerm_resource_group.RGtf_webapps.name
  tags                = azurerm_resource_group.RGtf_webapps.tags

  kind     = "Linux"
  reserved = true
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "cadri" {
  count               = length(var.webapplocs)
  name                = "webapp-${random_string.webapprnd.result}-${count.index}"
  location            = var.webapplocs[count.index]
  resource_group_name = azurerm_resource_group.RGtf_webapps.name
  tags                = azurerm_resource_group.RGtf_webapps.tags

  app_service_plan_id = element(azurerm_app_service_plan.free.*.id, count.index)
}

output "webapp_ids" {
  description = "value"
  value       = azurerm_app_service_plan.free.*.id
}
