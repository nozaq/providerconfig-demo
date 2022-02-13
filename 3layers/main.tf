terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

provider "null" {
}

provider "null" {
  alias = "second"
}

resource "null_resource" "level1" {
  provider = null.second
}

module "foo" {
  providers = {
    null = null.second
  }

  source = "./modules/a"
}
