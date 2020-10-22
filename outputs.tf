output "external_ip" {
  description = "The external IP address attached to the VM instance."
  value       = local.external_ip
}

output "sa_email" {
  description = "Email address of the ServiceAccount that is attached to the VM instance."
  value       = local.vm_sa_email
}

output "sa_roles" {
  description = "All roles (except sensitive roles filtered by the module) that are attached to the ServiceAccount generated for this VM."
  value = (
    local.create_new_sa == true
    ?
    module.service_account.0.roles
    :
    ["No new ServiceAccount was generated for this VM. See roles attached to the ServiceAccount '${local.vm_sa_email}' instead."]
  )
}
