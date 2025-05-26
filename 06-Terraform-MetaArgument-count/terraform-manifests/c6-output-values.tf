# Terraform Output Values
/* Concepts Covered
1. For Loop with List
2. For Loop with Map
3. For Loop with Map Advanced
4. Legacy Splat Operator (latest) - Returns List
5. Latest Generalized Splat Operator - Returns the List
*/

# Get each list item separately
output "vm_name_0" {
  description = "VM NAME"
  value = google_compute_instance.myapp1[0].name
  
}

output "vm_name_1" {
  description = "VM NAME"
  value = google_compute_instance.myapp1[1].name
  
}

#Output - For Loop with List
output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in google_compute_instance.myapp1: instance.name]
  
}

#Output - For Loop with Map
output "for_output_map1" {
  description = "For Loop with Map"
  value = {for instance in google_compute_instance.myapp1: instance.name => instance.instance_id}
  
}

#Output - For Loop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in google_compute_instance.myapp1: c => instance.instance_id}
  
}

#Output - For Loop with Map Advanced
output "for_output_map3" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in google_compute_instance.myapp1: instance.name => instance.instance_id}
  
}

#Legacy Splat Operator (latest) - Returns List
output "legacy_splat_operator" {
  description = "Legacy Splat Operator"
  value = google_compute_instance.myapp1.*.name
  
}

#Latest Generalized Splat Operator - Returns the List
output "legacy_splat_instance" {
  description = "Generalized Latest Splat Operator"
  value = google_compute_instance.myapp1[*].name
  
}

/* 
------- FOR SINGLE VM INSTANCE -------
# Terraform Output Values
## ATTRIBUTES
output "vm_instanceid" {
  description = "VM Instance ID"
  value = google_compute_instance.myapp1.instance_id
}

output "vm_selflink" {
  description = "VM Instance Self link"
  value = google_compute_instance.myapp1.self_link
}

output "vm_id" {
  description = "VM ID"
  value = google_compute_instance.myapp1.id
}

## ARGUMENTS
output "vm_name" {
  description = "VM Name"
  value = google_compute_instance.myapp1.name
}

output "vm_machine_type" {
  description = "VM Machine Type"
  value = google_compute_instance.myapp1.machine_type
}
*/