variable "name" {}

# User data if of form:
# user_data = {
#   organisation = "randb"
#   groups       = ["administrators", "terraform_planners"]
# }
variable "user_data" {
  type = object({
    organisation = string
    groups       = list(string)
    }
  )
}

variable "environment" {
  default = "aws-ets-inf-managment"
}

variable "attach_policy_arns" {
  description = "policies to attach to user"
  type = list
}
