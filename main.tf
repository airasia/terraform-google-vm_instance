terraform {
  required_version = ">= 0.12.24" # see https://releases.hashicorp.com/terraform/
  experiments      = [variable_validation]
}

provider "google" {
  version = ">= 3.13.0" # see https://github.com/terraform-providers/terraform-provider-google/releases
}

locals {
  instance_name = format("%s-vm-%s", var.name, var.name_suffix)
  static_ip     = var.static_ip == "" ? null : var.static_ip
  tags          = toset(concat(var.tags, [var.name_suffix]))
}

resource "google_project_service" "compute_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_compute_instance" "vm_instance" {
  name         = local.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = local.tags
  boot_disk {
    initialize_params {
      image = var.boot_disk_image_source
    }
  }
  network_interface {
    subnetwork = var.vpc_subnetwork
    access_config { nat_ip = local.static_ip }
  }
  metadata = {
    enable-oslogin = (var.os_login_enabled ? "TRUE" : "FALSE") # see https://cloud.google.com/compute/docs/instances/managing-instance-access#enable_oslogin
  }
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
  allow_stopping_for_update = var.allow_stopping_for_update
  depends_on                = [var.module_depends_on, google_project_service.compute_api]
}
