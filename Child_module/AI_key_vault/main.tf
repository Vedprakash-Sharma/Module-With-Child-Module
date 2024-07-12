data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vedanta_bharat" {
  for_each                   = var.veda_key
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days
  purge_protection_enabled   = each.value.purge_protection_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Create", "Get", "List" ]

    secret_permissions = ["Set", "Get", "Delete", "Purge", "Recover", "List" ]
  }
}
resource "azurerm_key_vault_secret" "user" {
  for_each     = var.veda_key
  name         = each.value.user_name
  value        = each.value.user_value
  key_vault_id = azurerm_key_vault.vedanta_bharat[each.key].id
}

resource "azurerm_key_vault_secret" "pass" {
  for_each     = var.veda_key
  name         = each.value.pass_name
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.vedanta_bharat[each.key].id
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}