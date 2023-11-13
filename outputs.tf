output "virtual_machine_name" {
  description = "The name of the Windows Virtual Machine"
  value = module.virtual_machine.virtual_machine_name
}
output "virtual_machine_size" {
  description = "The size of the windows Virtual machine"
  value = module.virtual_machine.virtual_machine_size
}