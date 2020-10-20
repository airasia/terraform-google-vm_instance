output "static_ip" {
  description = "The static IP address attached to the VM instance."
  value       = local.static_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is attached to the VM instance."
  value       = local.vm_sa_email
}
