variable "vpc_id" {
  type = string
}
variable "resource_suffix" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "ami-filter" {
  type = string
}
# Looks like the original instance profile was created manually, so make this switchable
variable "create_instance_profile" {
  default = false
  type    = bool
}
