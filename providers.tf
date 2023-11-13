terraform {
  cloud {
    organization = "tfo-apj-demos"

    workspaces {
      project = "10 - gcve-foundations"
      name    = "gcve-dc-0"
    }
  }
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
      version = "0.4.4"
    }

    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.10"
    }
  }
}

provider "vsphere" {
}

provider "nsxt" {
}

provider "ad" {
}