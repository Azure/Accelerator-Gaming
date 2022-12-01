resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name = "vmss-${var.resource_suffix}-${var.resource_instance}-${var.resource_location}"
    resource_group_name = var.resource_group_name
    location            = var.resource_location
    sku                 = "Standard_D2s_v3"
    instances           = 2
    admin_username      = "azureuser"
    admin_password      = "P@ssw0rd1234!"

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
        name                          = var.network_interface_id
        primary                       = true
        enable_accelerated_networking = false
        enable_ip_forwarding          = false
        ip_configuration {
            name                                   = var.ip_configuration_name
            primary                                = true
            subnet_id                              = var.subnet_id
        }
    }
}

