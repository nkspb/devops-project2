terraform {
  required_providers {
    selectel = {
      source = "selectel/selectel"
      version = "3.9.1"
    }

    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.51.1"
    }
  }
}

provider "selectel" {
  # Configuration options
  token = var.selectel_token
}

provider "openstack" {
  auth_url    = "https://api.selvpc.ru/identity/v3"
  domain_name = "234004"
  tenant_id   = "6b097945729d4c7683a04a312c65c37f"
  user_name   = var.os_username
  password    = var.os_password
  region      = "ru-3"
}
