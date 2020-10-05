terraform {
  required_version = ">= 0.13.1" # see https://releases.hashicorp.com/terraform/
}

data "google_client_config" "google_client" {}

locals {
  instance_name = format("%s-vm-%s", var.name, var.name_suffix)
  static_ip     = var.static_ip == "" ? null : var.static_ip
  tags          = toset(concat(var.tags, [var.name_suffix]))
  zone          = "${data.google_client_config.google_client.region}-${var.zone}"
}

resource "google_project_service" "compute_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_instance" "vm_instance" {
  name         = local.instance_name
  machine_type = var.machine_type
  zone         = local.zone
  tags         = local.tags
  boot_disk {
    initialize_params {
      size  = var.boot_disk_size
      type  = var.boot_disk_type
      image = var.boot_disk_image_source
    }
  }
  network_interface {
    subnetwork = var.vpc_subnetwork
    dynamic "access_config" {
      # Set 'access_config' block only if 'static_ip' is provided
      for_each = local.static_ip == null ? [] : [1]
      content {
        nat_ip = local.static_ip
      }
    }
  }
  metadata = {
    enable-oslogin = (var.os_login_enabled ? "TRUE" : "FALSE") # see https://cloud.google.com/compute/docs/instances/managing-instance-access#enable_oslogin
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
  allow_stopping_for_update = var.allow_stopping_for_update
  depends_on                = [google_project_service.compute_api]
}
