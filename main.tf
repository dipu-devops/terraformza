resource "azurerm_resource_group" "zahidrg" {
  name     = var.zahidrg
  location = var.location
  lifecycle {
    prevent_destroy = true
  }
}

module "storageaccount" {
  source         = "./modules/storage"
  storageaccount = var.storageaccount
  zahidrg        = var.zahidrg
  location       = var.location
}

module "storageaccount2" {
  source         = "./modules/storage"
  storageaccount = var.storageaccount2
  zahidrg        = var.zahidrg
  location       = var.location

}


































# resource "azurerm_virtual_network" "zahidvnet" {
#   name                = "zahidvnet-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.location
#   resource_group_name = var.zahidrg
# }

# resource "azurerm_subnet" "zahidsubnet" {
#   name                 = "internal"
#   resource_group_name  = var.zahidrg
#   virtual_network_name = azurerm_virtual_network.zahidvnet.name
#   address_prefixes     = ["10.0.2.0/24"]

# }

# resource "azurerm_public_ip" "zahidpublicip" {
#   name                = "acceptanceTestPublicIp1"
#   resource_group_name = var.zahidrg
#   location            = var.location
#   allocation_method   = "Static"

#   tags = {
#     environment = "Production"
#   }
# }
# resource "azurerm_network_security_group" "zahidsng" {
#   name                = "example-nsg"
#   location            = var.location
#   resource_group_name = var.zahidrg

#   security_rule {
#     name                       = "SSH"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
# }
# }
# resource "azurerm_network_interface" "zahidnic" {
#   name                = "zahid-nic"
#   location            = var.location
#   resource_group_name = var.zahidrg

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.zahidsubnet.id
#     private_ip_address_allocation = "Dynamic"
#     private_ip_address_version    = "IPv4"
#     public_ip_address_id          = azurerm_public_ip.zahidpublicip.id
#   }
# }

# resource "azurerm_linux_virtual_machine" "zahidvm" {
#   name                = "zahidvm"
#   resource_group_name = var.zahidrg
#   location            = var.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   admin_password = "123456789@Pk"
#   disable_password_authentication = false
#   network_interface_ids = [
#     azurerm_network_interface.zahidnic.id,
#   ]


#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }