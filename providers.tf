terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.5.1"
    }
    nsxt = {
      source  = "vmware/nsxt"
      version = "3.4.0"
    }
    ad = {
      source  = "hashicorp/ad"
      version = "~> 0"
    }
    boundary = {
      source  = "hashicorp/boundary"
      version = "~> 1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0"
    }
  }
}

provider "vsphere" {
}

provider "nsxt" {
  allow_unverified_ssl = true
  max_retries          = 2
}

provider "ad" {
}

provider "boundary" {
  addr = var.boundary_address
  auth_method_id         = var.service_account_authmethod_id
  auth_method_login_name = var.service_account_name
  auth_method_password   = var.service_account_password
}