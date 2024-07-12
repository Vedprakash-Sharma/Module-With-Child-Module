resource "azurerm_resource_group" "vedanta_bharat" {
  for_each = var.veda
  name     = each.value.name
  location = each.value.location
}