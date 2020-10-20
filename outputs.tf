output "static_ip" {
  description = "The static IP address attached to the VM instance."
  value       = local.static_ip
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_compute_instance.vm_instance.self_link
}

output "id" {
  description = "an identifier for the resource with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
  value       = google_compute_instance.vm_instance.id
}

output "instance_id" {
  description = "The server-assigned unique identifier of this instance."
  value       = google_compute_instance.vm_instance.instance_id
}
