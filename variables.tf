# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "instance_name" {
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

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "machine_type" {
  description = "The type of VM instance for each nodes. See https://cloud.google.com/compute/docs/machine-types"
  type        = string
  default     = "f1-micro"
}

variable "zone" {
  description = "The GCloud zone-letter to launch the VM instance in. Options are \"a\" or \"b\" or \"c\" or \"d\". Defaults to \"a\" zone of the Google provider's region if nothing is specified here. See https://cloud.google.com/compute/docs/regions-zones."
  type        = string
  default     = "a"
}

variable "tags" {
  description = "List of identifiable tags for the VM instance."
  type        = list(string)
  default     = []
}

variable "external_ip" {
  description = "An external IP to be attached to the VM instance. VM is publicly unreachable if nothing is specified here."
  type        = string
  default     = ""
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

variable "boot_disk_size" {
  description = "The size of the boot disk in GigaBytes. Must be at least the size of the boot disk image."
  type        = number
  default     = 10
}

variable "boot_disk_type" {
  description = "The GCE disk type. May be set to \"pd-standard\", \"pd-balanced\" or \"pd-ssd\"."
  type        = string
  default     = "pd-standard"
}

variable "sa_name" {
  description = "An arbitrary name to identify the ServiceAccount that will be generated & attached to the VM instance. Uses \"var.instance_name\" if nothing is specified. Gets disregarded if \"var.sa_email\" is specified."
  type        = string
  default     = ""
}

variable "sa_description" {
  description = "An arbitrary description for the ServiceAccount that will be generated & attached to the VM instance. Gets disregarded if \"var.sa_email\" is specified."
  type        = string
  default     = "Manages permissions available to the VM instance."
}

variable "sa_roles" {
  description = "IAM roles to be granted to the ServiceAccount which is generated & attached to the VM instance. Gets disregarded if \"var.sa_email\" is specified."
  type        = list(string)
  default     = []
}

variable "sa_email" {
  description = "Email address of another ServiceAccount that will be attached to the VM instance. If specified, it disregards \"var.sa_name\", \"var.sa_description\", \"var.sa_roles\"."
  type        = string
  default     = ""
}

variable "user_groups" {
  description = "List of usergroup emails that maybe allowed access to login to the VM instance. For example: SSH login via CLoudSHell."
  type        = list(string)
  default     = []
}
