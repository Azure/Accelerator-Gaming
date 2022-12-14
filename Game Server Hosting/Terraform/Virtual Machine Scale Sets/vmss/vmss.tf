resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  count               = var.vmss_count
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.resource_location
  sku                 = var.vmss_sku
  instances           = 2
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name                          = var.network_interface_name
    primary                       = true
    enable_accelerated_networking = false
    enable_ip_forwarding          = false
    ip_configuration {
      name      = var.ip_configuration_name
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}

