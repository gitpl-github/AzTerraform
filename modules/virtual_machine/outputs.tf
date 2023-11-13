output "virtual_machine_name" {
  value = azurerm_windows_virtual_machine.myVM.name
}
output "virtual_machine_size" {
  value = azurerm_windows_virtual_machine.myVM.size
}