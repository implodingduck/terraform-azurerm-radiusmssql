output "result" {
  value = {
    values = {
      server   = azurerm_mssql_server.db.fully_qualified_domain_name
      port     = "1433"
      username = azurerm_mssql_server.db.administrator_login
      database = azurerm_mssql_database.db.name
    }
    secrets = {
      password = azurerm_mssql_server.db.administrator_login_password
      connectionString = "Server=tcp:${azurerm_mssql_server.db.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name},User ID=${azurerm_mssql_server.db.administrator_login},Password=${azurerm_mssql_server.db.administrator_login_password}"
    }
    // UCP resource IDs
    resources = [
        "/planes/azure/azurecloud${azurerm_mssql_server.db.id}",
        "/planes/azure/azurecloud${azurerm_mssql_database.db.id}",
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}