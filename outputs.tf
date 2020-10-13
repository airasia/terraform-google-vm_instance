output "usage_IAM_roles" {
  description = "Basic IAM role(s) that are generally necessary for using the resources in this module. See https://cloud.google.com/iam/docs/understanding-roles."
  value = [
    "roles/compute.instanceAdmin.v1",
  ]
}

output "static_ip" {
  description = "The static IP address attached to the VM instance."
  value       = local.static_ip
}
