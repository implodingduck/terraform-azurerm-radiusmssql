output "result" {
  value = {
    values = {
      server   = ""
      port     = ""
      username = ""
      database = ""
    }
    secrets = {
      password = ""
      connectionString = ""
    }
    // UCP resource IDs
    resources = [
        ""
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}