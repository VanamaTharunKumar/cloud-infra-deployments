resource "azurerm_resource_group" "demo" {
  name     = "demo-dev-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "main" {
  name                = "demo-dev-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
}

resource "azurerm_subnet" "public" {
  name                 = "demo-dev-public-subnet"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "demo-dev-public-ip"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "web_sg" {
  name                = "demo-dev-web-sg"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.my_public_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "demo-dev-nic"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "web" {
  name                  = "demo-dev-web-server"
  resource_group_name   = azurerm_resource_group.demo.name
  location              = azurerm_resource_group.demo.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}