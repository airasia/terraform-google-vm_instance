# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
}

variable "name" {
  description = "A name to identify the VM instance."
  type        = string
}

variable "boot_disk_image_source" {
  description = "The source image to build the VM's boot disk from. Specified by path reference or by {{project}}/{{image-family}}."
  type        = string
}

variable "vpc_subnetwork" {
  description = "A reference (self link) to the VPC subnet to host the VM instance in."
  type        = string
}

variable "zone" {
  description = "The GCloud zone to launch the VM instance in. See https://cloud.google.com/compute/docs/regions-zones."
  type        = string
}

variable "service_account_email" {
  description = "Email of the ServiceAccount that will grant specific IAM roles to the VM instance."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "machine_type" {
  description = "The type of VM instance for each nodes. See https://cloud.google.com/compute/docs/machine-types"
  type        = string
  default     = "f1-micro"
}

variable "tags" {
  description = "List of identifiable tags for the VM instance."
  type        = list(string)
  default     = []
}

variable "static_ip" {
  description = "A static IP to attach to the VM. Setting null will allocate an ephemeral IP."
  type        = string
  default     = null
}

variable "os_login_enabled" {
  description = "Whether the \"OS Login\" feature will be allowed in the VM instance. CoreOS instances require \"allow_stopping_for_update\" to be \"true\" for the changes to take effect. See https://cloud.google.com/compute/docs/instances/managing-instance-access."
  type        = bool
  default     = true
}

variable "allow_stopping_for_update" {
  description = "Allows Terraform to stop the VM instance to update its properties."
  type        = bool
  default     = true
}

variable "module_depends_on" {
  description = "Create explicit dependency of this module on values from other modules(s) and/or resource(s)."
  type        = list(string)
  default     = []
}
