resource "azurerm_resource_group" "RG_net" {
   name         = "RG_net"
   location     = var.loc
   tags         = var.tags
}

resource "azurerm_public_ip" "vpnGatewayPublicIp" {
  name                = "vpnGatewayPublicIp"
  resource_group_name = azurerm_resource_group.RG_net.name
  location            = azurerm_resource_group.RG_net.location
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network" "core" {
  name                = "core"
  location            = azurerm_resource_group.RG_net.location
  resource_group_name = azurerm_resource_group.RG_net.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "training"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "dev"
    address_prefix = "10.0.2.0/24"
  }
}

/*
resource "azurerm_vpn_gateway" "vpnGateway" {
  name                = "vpnGateway"
  location            = azurerm_resource_group.RG_net.location
  resource_group_name = azurerm_resource_group.RG_net.name
  virtual_hub_id      = azurerm_virtual_network.subnet.name["GatewaySubnet"]
  bgp_settings        = 
}
*/