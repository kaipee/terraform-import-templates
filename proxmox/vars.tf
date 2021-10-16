// Proxmox provider variables
variable "pm_api_url" {
  description = "This is the target Proxmox API endpoint."
  type        = string
  default     = "https://pve:8006/api2/json"
}

variable "pm_user" {
  description = "The user, remember to include the authentication realm such as myuser@pam or myuser@pve."
  type        = string
  sensitive   = false
  default     = "root@pam"
}

variable "pm_password" {
  description = "The password."
  type        = string
  sensitive   = true
}

variable "pm_api_token_id" {
  description = "This is an API token you have previously created for a specific user."
  type        = string
  sensitive   = false
  default     = "root@pam!terraform"
}

variable "pm_api_token_secret" {
  description = "This is a uuid that is only available when initially creating the token."
  type        = string
  sensitive   = true
}

variable "pm_otp" {
  description = "The 2FA OTP code."
  type        = number
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Disable TLS verification while connecting to the proxmox server."
  type        = bool
  default     = false
}

variable "pm_parallel" {
  description = "Allowed simultaneous Proxmox processes (e.g. creating resources)."
  type        = number
  default     = 4
}

variable "pm_log_enable" {
  description = "Enable debug logging, see the section below for logging details."
  type        = bool
  default     = false
}

variable "pm_log_levels" {
  description = "A map of log sources and levels"
  type        = map(any)
  default = {
    "default"    = "debug"
    "capturelog" = ""
  }
}

variable "pm_log_file" {
  description = "If logging is enabled, the log file the provider will write logs to."
  type        = string
  default     = "terraform-plugin-proxmox.log"
}

variable "pm_timeout" {
  description = "Timeout value (seconds) for proxmox API calls."
  type        = number
  default     = 300
}

variable "lxc_password" {
  description = "LXC container root password"
  type        = string
  sensitive   = true
  default     = "password"
}

variable "cipassword" {
  description = "cloud-init password"
  type        = string
  sensitive   = true
  default     = "password"
}

variable "ssh_public_keys" {
  description = "SSH public key"
  type        = string
  default     = ""
}
