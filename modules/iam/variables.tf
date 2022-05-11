variable "max_password_age" {
  default = 60
}

variable "min_password_length" {
  default = 12
}

variable "password_reuse_prevention" {
  default = 10
}

variable "role_max_session_duration" {
 default = 3600
}

variable "role_force_detach_policies" {
  default = false
}

variable "management_account" {}
