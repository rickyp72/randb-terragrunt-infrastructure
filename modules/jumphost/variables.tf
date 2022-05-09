variable "instance_type" { default = "t2.small" }
variable "instance_profile" { default = "SSM" }
variable "subnet_id" {}
variable "sgs"{}
variable "resource_suffix" {}
variable "ami-filter" {}
