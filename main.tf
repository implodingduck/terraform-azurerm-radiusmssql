locals {
    name = "radsql${substr(sha512(var.context.resource.id), 0, 16)}"
    merged_tags    = merge({ managed_by = "terraform" }, var.tags)
    loc_for_naming = lower(replace(var.location, " ", ""))
}

data "azurerm_client_config" "current" {}


resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.name}-${local.loc_for_naming}"
  location = var.location
  tags     = local.merged_tags
}

resource "azurerm_mssql_server" "db" {
  name                         = "${local.name}-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = substr(sha512(var.context.resource.id), 0, 16)
  minimum_tls_version          = "1.2"

  tags = local.merged_tags
}

resource "azurerm_mssql_database" "db" {
  name                        = "${local.name}db"
  server_id                   = azurerm_mssql_server.db.id
  max_size_gb                 = 32
  auto_pause_delay_in_minutes = 60
  min_capacity                = 1
  sku_name                    = "GP_S_Gen5_1"
  tags = local.merged_tags
}