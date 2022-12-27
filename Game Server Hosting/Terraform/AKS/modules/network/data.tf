data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}
data "azurerm_virtual_network" "hub_vnet" {
  provider            = azurerm.hub
  name                = var.hub_vnet_name
  resource_group_name = var.rg_hub
}




