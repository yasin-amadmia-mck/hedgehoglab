resource "azurerm_container_group" "hedgehoglab" {
  name                = "hedgehoglab"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [azurerm_subnet.container.id]

  container {
    name   = "frontend"
    image  = "hedgehoglab.azurecr.io/frontend:${var.frontend_tag}"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 3000
      protocol = "TCP"
    }
  }

  container {
    name   = "backend"
    image  = "hedgehoglab.azurecr.io/backend:${var.backend_tag}"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }
  }

}