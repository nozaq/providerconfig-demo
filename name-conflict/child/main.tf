terraform {
  required_providers {
    null = {
      source  = "nozaq/null"
      version = "3.1.0"
    }
  }
}

resource "null_resource" "none" {
}
