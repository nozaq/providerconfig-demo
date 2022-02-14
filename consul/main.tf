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

provider "consul" {
  address = "localhost:8500"
}

provider "consul" {
  alias   = "demo"
  address = "demo.consul.io:80"
}

data "consul_keys" "kv" {
  key {
    name = "aaa"
    path = "aaa"
  }
  provider = consul.demo
}

resource "null_resource" "none" {
  triggers = {
    aaa = data.consul_keys.kv.var.aaa
  }
}

module "child" {
  source    = "./child"
  providers = {
    consul = consul.demo
  }
}
