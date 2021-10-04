resource "azurerm_resource_group" "main" {
  name     = "rg-main"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-main"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "corp-it" {
  name                 = "subnet-corp-it"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.1.0/24"]
}

# resource "azurerm_subnet" "research" {
#   name                 = "subnet-research"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.1.2.0/24"]
# }

resource "azurerm_subnet" "finance" {
  name                 = "subnet-finance"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.3.0/24"]
}

resource "azurerm_subnet" "mfg" {
  name                 = "subnet-mfg"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.1.4.0/24"]
}