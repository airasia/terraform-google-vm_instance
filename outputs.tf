output "ip_address" {
  description = "The IP address (static if provided, or ephemeral if auto-generated) of the VM instance."
  value       = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}
