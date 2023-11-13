output "virtual_machine_id" {
  description = "The ID of the virtual machine."
  value       = module.vm.virtual_machine_id
}

output "vsphere_compute_cluster_id" {
  description = "The ID of the vSphere compute cluster where the VM is deployed."
  value       = module.vm.vsphere_compute_cluster_id
}

output "virtual_machine_name" {
  description = "The name of the virtual machine."
  value       = module.vm.virtual_machine_name
}

output "ip_address" {
  description = "The default IP address of the virtual machine."
  value       = module.vm.ip_address
}

output "guest_id" {
  description = "guest_id"
  value       = module.vm.guest_id
}

output "nsxt_allocated_ip_address" {
  description = "The IP address from the NSX IP Address Pool"
  value = nsxt_policy_ip_address_allocation.this.allocation_ip
}