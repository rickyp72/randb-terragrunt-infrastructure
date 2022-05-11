locals {
  randb-management_ac_number        = 245879739180
  randb-dev_ac_number = 487005335896
}

#resource "aws_iam_account_password_policy" "this" {
#  max_password_age               = var.max_password_age
#  minimum_password_length        = var.min_password_length
#  password_reuse_prevention      = var.password_reuse_prevention
#  require_lowercase_characters   = true
#  require_numbers                = true
#  require_uppercase_characters   = true
#  require_symbols                = true
#  allow_users_to_change_password = true
#}