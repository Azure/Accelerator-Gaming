resource "azurerm_resource_group" "rg_agw" {
  name     = var.agw_rg_name
  location = var.resource_location
  tags     = var.resource_tags
}
resource "azurerm_virtual_network" "vmss_vnet" {
  name                = var.vmss_vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_location
  resource_group_name = azurerm_resource_group.rg_agw.name
  tags                = var.resource_tags
}
resource "azurerm_subnet" "agw_subnet" {
  name                 = var.agw_subnet_name
  resource_group_name  = azurerm_resource_group.rg_agw.name
  virtual_network_name = azurerm_virtual_network.vmss_vnet.name
  address_prefixes     = var.agw_subnet_address_prefix
}
resource "azurerm_public_ip" "agw_pip" {
  name                = var.agw_pip
  location            = var.resource_location
  resource_group_name = azurerm_resource_group.rg_agw.name
  allocation_method   = "Dynamic"
  sku                 = "Standard"
  tags                = var.resource_tags
}
resource "azurerm_application_gateway" "agw" {
  name                = var.agw_name
  resource_group_name = azurerm_resource_group.rg_agw.name
  location            = var.resource_location
  sku {
    name     = var.agw_sku_name
    tier     = var.agw_sku_tier
    capacity = var.agw_capacity
  }
  gateway_ip_configuration {
    name      = var.gw_ipconfig_name
    subnet_id = azurerm_subnet.agw_subnet.id
  }
  frontend_port {
    name = var.frontend_port_name
    port = 443
  }
  frontend_ip_configuration {
    name                          = var.frontend_ipconfig_name
    subnet_id                     = azurerm_subnet.agw_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  backend_address_pool {
    name = var.backend_address_pool_name
  }
  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 443
    protocol              = "Https"
    request_timeout       = 1
  }
  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "http"
    protocol                       = "Https"
    ssl_certificate_name           = "appGatewaySslCertificate"
  }
  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings_name
  }
}

