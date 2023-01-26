resource "azurerm_resource_group" "rg_vmss" {
  name     = "rg-vmss-${var.prefix}-${var.resource_location}"
  location = var.resource_location
  tags     = var.resource_tags
}
resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  count                      = 3
  name                       = "vmss-${var.prefix}-${var.resource_location}-${count.index + 1}"
  computer_name_prefix       = "vmss-${count.index + 1}"
  resource_group_name        = azurerm_resource_group.rg_vmss.name
  location                   = azurerm_resource_group.rg_vmss.location
  sku                        = var.vmss_sku
  instances                  = 2
  admin_username             = var.admin_username
  admin_password             = var.admin_password
  zone_balance               = true
  zones                      = ["1", "2", "3"]
  enable_automatic_updates   = false
  upgrade_mode               = "Manual" /*Other choices: Automatic or Rolling*/
  encryption_at_host_enabled = false
  license_type               = "Windows_Server" /*Other choices: Windows_Client*/
  tags                       = var.resource_tags
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  network_interface {
    name                          = "nic-vmss-${var.prefix}-${count.index + 1}"
    primary                       = true
    enable_accelerated_networking = true
    enable_ip_forwarding          = false
    ip_configuration {
      name      = "ipconfig-${var.prefix}-${count.index + 1}"
      primary   = true
      subnet_id = var.subnet_id
      public_ip_address {
        name                = "pip-vmss-${var.prefix}-${count.index + 1}"
        public_ip_prefix_id = var.pip_prefix_id
      }
    }
  }
}