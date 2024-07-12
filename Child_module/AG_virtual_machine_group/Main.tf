# resource "azurerm_public_ip" "pip" {
#   for_each            = var.veda_vm
#   name                = each.value.pip_name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   allocation_method   = each.value.allocation_method
# }
resource "azurerm_network_interface" "veda-nic" {
  for_each            = var.veda_vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.vedadatasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  
    # public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}
resource "azurerm_linux_virtual_machine" "veda_machine" {
  for_each                        = var.veda_vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = data.azurerm_key_vault_secret.ganga.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.veda-nic[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  # 



}
  