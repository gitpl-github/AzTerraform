resource "azurerm_windows_virtual_machine" "myVM" {
    name = var.virtual_machine_name
    location = var.location
    resource_group_name = var.resource_group_name

    network_interface_ids = [var.nic_id]
    size = var.virtual_machine_size
    admin_username = var.admin_username
    admin_password = var.admin_password

    os_disk {
      name = "${var.virtual_machine_name}-osdisk"
      caching = var.caching
      storage_account_type = var.storage_account_type
      disk_size_gb = var.disk_size_gb
    }

    source_image_reference {
      publisher = var.Publisher
      offer = var.offer
      sku = var.sku
      version = "latest"
    }
}