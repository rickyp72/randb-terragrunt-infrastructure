variable "bucket_name" {}

variable "acl" {
  default = "private"
}

variable "tags" {
  type = map(string)
  default = {}
}