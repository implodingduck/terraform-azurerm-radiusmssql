variable "context" {
  type = any
  default = {
    resource = {
      id = "1234-5678-9012-3456"
      name = "hardcoded"
    }
    runtime = {
      kubernetes = {
        namespace = "default"
      }
    }
  }
}

variable "tags" {
  type = map  
  default = {}
}

variable "location" {
  type = string
  default = "eastus"
}