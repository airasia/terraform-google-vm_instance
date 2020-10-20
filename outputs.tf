output "static_ip" {
  description = "The static IP address attached to the VM instance."
  value       = local.static_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is generated for the VM instance."
  value       = module.vm_service_account.email
}
