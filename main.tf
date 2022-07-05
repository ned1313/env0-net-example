locals {
  base_name = "${var.prefix}${var.environment}net"
  common_tags = merge(var.common_tags, {
    BusinessUnit = var.business_unit_tag
    Organization = var.organization_tag
    Environment  = var.environment
  })
}

resource "azurerm_resource_group" "main" {
  name     = local.base_name
  location = var.location

  tags = local.common_tags

}

resource "azurerm_virtual_network" "main" {
  name                = local.base_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  address_space = var.vnet_address_space

  tags = local.common_tags
}

resource "azurerm_subnet" "main" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_space
}
