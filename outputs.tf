output "external_ip" {
  description = "The external IP address attached to the VM instance."
  value       = local.external_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is attached to the VM instance."
  value       = local.vm_sa_email
}
