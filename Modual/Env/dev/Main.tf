module "rg1" {
  source = "../../../Child_module/AA_resource_group"
  veda   = var.veda

}
module "modstorage" {
  source  = "../../../Child_module/AB_Storage"
  storage = var.storage01

}

module "modcontainer" {
  source     = "../../../Child_module/AC_Container_group"
  container  = var.ranjeet
  depends_on = [module.modstorage]
}

module "modvnet" {
  source          = "../../../Child_module/AD_v_network_group"
  virtule_network = var.virtule_net1
  depends_on      = [module.rg1]

}
module "modsubnet" {
  source      = "../../../Child_module/AF_subnet_group"
  veda_subnet = var.veda_subnet
  depends_on  = [module.modvnet]

}
module "modvirtualmachine" {

  source     = "../../../Child_module/AG_virtual_machine_group"
  veda_vm    = var.veda_vm
  depends_on = [module.modsubnet, module.modkeyvt]
}
module "moddb" {
  source     = "../../../Child_module/AH_MS_sql_DB"
  veda-db    = var.veda-db
  depends_on = [module.rg1]

}

module "modkeyvt" {
  source     = "../../../Child_module/AI_key_vault"
  veda_key   = var.veda_key
  depends_on = [module.rg1]

}

module "modhost" {
  source     = "../../../Child_module/Bastion_host"
  veda_host  = var.veda_host
  depends_on = [module.modsubnet]

}

