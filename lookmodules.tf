# variable "departmentname" {
#   type = set(string)
#   default = [ "hr", "it", "finance", "zahidtf" ]
# }


# resource "azurerm_resource_group" "zahidrg" {
#   for_each = var.departmentname

#   name = "${each.key}-rg-resources"
#   location = "West Europe"
# }

# output "resource_group_names" {
#   value = [for rg in azurerm_resource_group.zahidrg : rg.name]
# }


# resource "azurerm_resource_group" "deeprg" {
#   name     = "deep"
#   location = "West Europe"
# }