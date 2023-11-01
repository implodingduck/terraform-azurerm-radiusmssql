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
      connectionString = ""
    }
    // UCP resource IDs
    resources = [
        "/planes/azure/azurecloud/${azurerm_resource_group.rg.id}",
        "/planes/azure/azurecloud/${azurerm_mssql_server.db.id}",
        "/planes/azure/azurecloud/${azurerm_mssql_database.db.id}",
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}