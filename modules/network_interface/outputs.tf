output "nic_id" {
  description = "The NIC ID of the Network Interface"
  value = azurerm_network_interface.myNIC.id
}
