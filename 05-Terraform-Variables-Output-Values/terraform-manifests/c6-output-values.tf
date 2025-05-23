#Terraform Output Values

## ATTRIBUTES
output "vm_instanceid" {
  description = "VM INSTANCE ID"
  value = google_compute_instance.myapp1.instance_id  
}

output "selflink" {
  description = "VM INSTANCE SELFLINK"
  value = google_compute_instance.myapp1.self_link
}

output "vm_id" {
  description = "VM ID"
  value = google_compute_instance.myapp1.id
}

output "vm_external_ip" {
  description = "VM EXTERNAL IP"
  value = google_compute_instance.myapp1.network_interface.0.access_config.0.nat_ip
}

## ARGUMENTS
output "vm_machine_type" {
  description = "VM MACHINE TYPE"
  value = google_compute_instance.myapp1.machine_type
}

output "vm_name" {
  description = "VM NAME"
  value = google_compute_instance.myapp1.name
  
}