variable "vm_ip" {
  description = "IP address of the target VM"
  type        = string
}

variable "vm_user" {
  description = "Username for SSH access"
  type        = string
}

variable "vm_password" {
  description = "Password for SSH access"
  type        = string
  sensitive   = true
}
