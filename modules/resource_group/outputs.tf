output "resource_group_name" {
  description = "The name of the Resource Group"
  value = azurerm_resource_group.myTFResourceGroup.name
}
output "location" {
  value = azurerm_resource_group.myTFResourceGroup.location
}