# define the three networks ip ranges vnets and snets


resource "azurerm_virtual_network" "networks" {
  name                = "networks"
  location            = location
  resource_group_name = local.resourcegroup
  address_space       = ["10.151.151.0/20"]
  dns_servers         = ["10.123.0.20"]
  tags = {
    owner-id = "Steve"
    workload-name = "KPMG"
    environment = "Global"
    environment-location = "Amsterdam"
    data-classification = "Internal"
    service-category = "Gold"
    tag-version = "1.0"
  }
}