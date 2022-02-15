terraform {
  required_providers {
    consul = {
      source = "hashicorp/consul"
      version = "2.14.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

data "consul_keys" "kv" {
  key {
    name = "aaa"
    path = "aaa"
  }
}

resource "null_resource" "none" {
  triggers = {
    aaa = data.consul_keys.kv.var.aaa
  }
}
