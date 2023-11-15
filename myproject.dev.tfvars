resource_group_name = var.resource_group_name
location = "centralindia"
virtual_network_name = "my-vnet"
subnet_name = "my-subnet"
network_interface_name = "my_NIC"
public_ip_name = var.public_ip_name
virtual_machine_name = var.virtual_machine_name
virtual_machine_size = "standard_DS2_V2"
admin_username = "myAdminUser"
admin_password = "Password@123"
caching = "ReadWrite"
storage_account_type = "Standard_LRS"
disk_size_gb = "127"
publisher = "MicrosoftWindowsServer"
offer = "WindowsServer"
sku = "2019-Datacenter"
