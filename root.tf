resource "azurerm_resource_group" "RGtf_TESTimport" {
  name     = "RGtf_TESTimport"
  location = var.loc
  tags     = var.tags
}
