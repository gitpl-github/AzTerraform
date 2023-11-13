terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
  resource_group_name  = var.resource_group_name
  location = var.location
}
module "virtual_network" {
  source = "./modules/virtual_network"
  virtual_network_name = var.virtual_network_name
  location = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  depends_on = [module.resource_group]
}
module "subnet" {
  source = "./modules/subnet"
  subnet_name = var.subnet_name
  resource_group_name = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.virtual_network_name
  depends_on = [ module.virtual_network ]
}
module "public_ip" {
  public_ip_name = var.public_ip_name
  source = "./modules/public_ip"
  resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.location
  depends_on = [ module.subnet ]
}
module "network_interface" {
  source = "./modules/network_interface"
  network_interface_name = var.network_interface_name
  location = module.resource_group.location
  virtual_network_name = module.virtual_network.virtual_network_name
  resource_group_name = module.resource_group.resource_group_name 
  subnet_id = module.subnet.subnet_id
  public_ip_address_id = module.public_ip.public_ip_address_id
  depends_on = [module.public_ip]
}

module "virtual_machine" {
  source              = "./modules/virtual_machine"
  virtual_machine_name = var.virtual_machine_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  virtual_machine_size = var.virtual_machine_size
  admin_username      = var.admin_username 
  admin_password      = var.admin_password 
  sku = var.sku
  disk_size_gb = var.disk_size_gb
  nic_id = module.network_interface.nic_id 
  offer = var.offer
  storage_account_type = var.storage_account_type
  caching = var.caching
  Publisher = var.publisher
  depends_on = [ module.network_interface ]
}

