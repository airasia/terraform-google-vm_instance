output "external_ip" {
  description = "The external IP address attached to the VM instance."
  value       = local.external_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is attached to the VM instance."
  value       = local.vm_sa_email
}

output "sa_roles" {
  description = "All roles (except sensitive roles filtered by the module) that are attached to the ServiceAccount of this VM."
  value       = module.service_account.roles
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_compute_instance.vm_instance.self_link
}

output "id" {
  description = "An identifier for the resource with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
  value       = google_compute_instance.vm_instance.id
}

output "instance_id" {
  description = "The server-assigned 19 digits unique identifier of this instance. Example: 4567719474035761998"
  value       = google_compute_instance.vm_instance.instance_id
}

output "instance_name" {
  description = "The generated name of the GCloud VM Instance with format {{instance-name}}-vm-{{suffix with 4 characters random string separated with -}}. Example: vm-instance-tf-1a2b"
  value       = local.instance_name
}