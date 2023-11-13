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
  allow_unverified_ssl = true
  max_retries          = 2
}

provider "ad" {
}