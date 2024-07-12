resource "azurerm_mssql_server" "veda_server" {
  for_each                     = var.veda-db
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

resource "azurerm_mssql_database" "veda_database" {
  for_each       = var.veda-db
  name           = each.value.database_name
  server_id      = azurerm_mssql_server.veda_server[each.key].id
  collation      = each.value.collation
  license_type   = each.value.license_type
  max_size_gb    = each.value.max_size_gb
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant
  enclave_type   = each.value.enclave_type

}