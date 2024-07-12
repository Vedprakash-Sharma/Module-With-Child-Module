data "azurerm_subnet" "vedadatasubnet" {
  for_each             = var.veda_vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_key_vault" "Vedanta_data_key" {
  name                = "gangavault"
  resource_group_name = "Backend-rg"
}

data "azurerm_key_vault_secret" "ganga" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.Vedanta_data_key.id
}

output "secret_value" {
  value      = data.azurerm_key_vault_secret.ganga.value
  sensitive  = true
  depends_on = [data.azurerm_key_vault_secret.ganga]
}

