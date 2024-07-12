veda = {
  resource-01 = {
    name     = "frontend-rg"
    location = "centralindia"
  }

  resource-02 = {
    name     = "Backend-rg"
    location = "eastus"
  }
}
storage01 = {
  storage99 = {
    name                     = "janddu"
    resource_group_name      = "Backend-rg"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}
ranjeet = {
  container01 = {
    name                  = "vedacontainer01"
    storage_account_name  = "janddu"
    container_access_type = "private"
  }
}
virtule_net1 = {
  vnet_01 = {
    name                = "veda_vnet"
    location            = "centralindia"
    resource_group_name = "frontend-rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.1.5"]
  }
  vnet_02 = {
    name                = "veda_virtual_network"
    location            = "eastasia"
    resource_group_name = "backend-rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.2.4", "10.0.4.5"]
  }
}
# 02 vm Done
veda_subnet = {
  subnet_01 = {
    name                 = "frontend-subnet"
    resource_group_name  = "frontend-rg"
    virtual_network_name = "veda_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  #  02 VM done for load balancer
  subnet_02 = {
    name                 = "backend-subnet"
    resource_group_name  = "frontend-rg"
    virtual_network_name = "veda_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  # 02 VM Done
  subnet_04 = {
    name                 = "backend-subnet"
    resource_group_name  = "backend-rg"
    virtual_network_name = "veda_virtual_network"
    address_prefixes     = ["10.0.1.0/24"]
  }
  # VM not done
  subnet_05 = {
    name                 = "frontend-subnet"
    resource_group_name  = "backend-rg"
    virtual_network_name = "veda_virtual_network"
    address_prefixes     =  ["10.0.2.0/24"]
  }
  subnet_Bastion_Host = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "frontend-rg"
    virtual_network_name = "veda_vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }
  subnet_Bastion_Host_02 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "backend-rg"
    virtual_network_name = "veda_virtual_network"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

veda_vm = {
  vm-01 = {
    pip_name             = "veda_pip"
    nic_name             = "bharat-nic"
    resource_group_name  = "frontend-rg"
    location             = "centralindia"
    allocation_method    = "Static"
    vm_name              = "backend"
    size                 = "Standard_F2"
    admin_username       = "vedanta"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "veda_vnet"
  }
  vm-02 = {
    pip_name             = "veda_public"
    nic_name             = "pakistan"
    resource_group_name  = "frontend-rg"
    location             = "centralindia"
    allocation_method    = "Static"
    vm_name              = "frontend"
    size                 = "Standard_F2"
    admin_username       = "vedanta"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "veda_vnet"
  }
  #    vm-04 = {
  #     pip_name            = "veda_pip02"
  #     nic_name            = "bharat-nic02"
  #     resource_group_name = "frontend-rg"
  #     location            = "southeastasia"
  #     allocation_method   = "Static"
  #     vm_name             = "frontend-machine02"
  #     size                = "Standard_F2"
  #     admin_username      = "vedanta"
  #     admin_password      = "ved@sharma0708"
  #     subnet_name         = "frontend-subnet"
  #     virtual_network_name = "veda_vnet"

  # }
  #    vm-05 = {
  #     pip_name            = "veda_public04"
  #     nic_name            = "veda_nic04"
  #     resource_group_name = "backend-rg"
  #     location            = "eastasia"
  #     allocation_method   = "Static"
  #     vm_name             = "frontend-machine04"
  #     size                = "Standard_F2"
  #     admin_username      = "vedanta"
  #     admin_password      = "ved@sharma0708"
  #     subnet_name         = "backend-subnet"
  #   virtual_network_name  = "veda_virtual_network"

  #   }
  #      vm-06 = {
  #     pip_name            = "veda_pip06"
  #     nic_name            = "bharat-nic06"
  #     resource_group_name = "frontend-rg"
  #     location            = "southeastasia"
  #     allocation_method   = "Static"
  #     vm_name             = "frontend-machine06"
  #     size                = "Standard_F2"
  #     admin_username      = "vedanta"
  #     admin_password      = "ved@sharma0708"
  #     subnet_name         = "backend-subnet"
  #     virtual_network_name = "veda_vnet"

  # }
  #      vm-07 = {
  #     pip_name            = "veda_pip07"
  #     nic_name            = "bharat-nic07"
  #     resource_group_name = "frontend-rg"
  #     location            = "southeastasia"
  #     allocation_method   = "Static"
  #     vm_name             = "frontend-machine06"
  #     size                = "Standard_F2"
  #     admin_username      = "vedanta"
  #     admin_password      = "ved@sharma0708"
  #     subnet_name         = "backend-subnet"
  #     virtual_network_name = "veda_vnet"

  # }
}
veda-db = {
  mssql-01 = {
    server_name                  = "dataserver01"
    resource_group_name          = "frontend-rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "vedanta"
    administrator_login_password = "Ved@sharma0708"
    database_name                = "MSsql-data-base"
    collation                    = "SQL_Latin1_General_CP1_CI_AS"
    license_type                 = "LicenseIncluded"
    max_size_gb                  = 2
    sku_name                     = "S0"
    zone_redundant               = false
    enclave_type                 = "VBS"
  }
}
veda_key = {
  key_vault = {
    name                       = "gangavault"
    location                   = "eastus"
    resource_group_name        = "Backend-rg"
    sku_name                   = "premium"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    user_name                  = "user"
    user_value                 = "vedanta"
    pass_name                  = "password"
  }
}
veda_host = {
  bastion-01 = {
    pip_name             = "Bastion_host_ip"
    location             = "centralindia"
    resource_group_name  = "frontend-rg"
    allocation_method    = "Static"
    sku                  = "Standard"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "veda_vnet"
    bastion_name         = "Bastion"
    ip_name              = "Ip_confi_Bastion_Host"
  }



}