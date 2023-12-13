data "nsxt_policy_ip_pool" "this" {
  display_name = "10 - gcve-foundations"
}

data "hcp_packer_image" "base-windows-2022" {
  bucket_name    = "base-windows-2022"
  channel        = "latest"
  cloud_provider = "vsphere"
  region         = "Datacenter"
}

resource "nsxt_policy_ip_address_allocation" "this" {
  display_name = "dc-0"
  description  = "Terraform provisioned Ip Address Allocation"
  pool_path    = data.nsxt_policy_ip_pool.this.path
}

module "vm" {
  source = "github.com/tfo-apj-demos/terraform-vsphere-virtual-machine"

  lifecycle = {
    ignore_changes = [template]
  }

  template          = data.hcp_packer_image.base-windows-2022.cloud_image_id

  datacenter        = var.site
  cluster           = var.environment
  resource_pool     = var.tier
  primary_datastore = var.storage_profile
  folder_path       = var.folder_path
  hostname          = var.hostname
  num_cpus          = var.num_cpus
  memory            = var.memory
  disk_0_size       = var.disk_0_size
  admin_password    = var.admin_password
  workgroup         = var.workgroup

  networks = {
    "seg-general" = "${nsxt_policy_ip_address_allocation.this.allocation_ip}/22"
  }
  gateway         = var.gateway
  dns_server_list = var.dns_server_list
  dns_suffix_list = var.dns_suffix_list

  tags = {
    environment      = "prod"
    site             = "sydney"
    backup_policy    = "daily"
    tier             = "gold"
    storage_profile  = "standard"
    security_profile = "web-server"
  }
}

/*resource "ad_ou" "hashi" {
  name        = "hashi"
  path        = "dc=hashi,dc=local"
  description = "OU for HashiCorp Solution Engineers and Architects"
  protected   = true
}

variable "name" { default = "hashi admins" }
variable "sam_account_name" { default = "HASHIADMINS" }
variable "scope" { default = "global" }
variable "category" { default = "security" }

resource "ad_group" "hashi_admins" {
  name             = var.name
  sam_account_name = var.sam_account_name
  scope            = var.scope
  category         = var.category
  container        = ad_ou.hashi.dn
  description      = "HashiCorp Solution Engineers and Architects Admins"
}*/