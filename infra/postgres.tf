resource "azurerm_postgresql_flexible_server" "default" {
  name                          = "${var.name_prefix}-server"
  resource_group_name           = azurerm_resource_group.default.name
  location                      = azurerm_resource_group.default.location
  version                       = var.postgres_version
  delegated_subnet_id           = azurerm_subnet.db.id
  private_dns_zone_id           = azurerm_private_dns_zone.default.id
  public_network_access_enabled = false
  administrator_login           = "adminTerraform"
  administrator_password        = random_password.pass.result
  zone                          = "1"
  storage_mb                    = var.postgres_storage_mb
  sku_name                      = var.postgres_sku
  backup_retention_days         = var.postgres_backup_retention_days

  depends_on = [azurerm_private_dns_zone_virtual_network_link.default]
}

resource "azurerm_postgresql_flexible_server_database" "default" {
  name      = "${var.name_prefix}-db"
  server_id = azurerm_postgresql_flexible_server.default.id
  collation = "en_US.utf8"
  charset   = "UTF8"
}