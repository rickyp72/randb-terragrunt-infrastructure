# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "randb-tfstate"
    dynamodb_table = ""
    encrypt        = true
    key            = "./terraform.tfstate"
    region         = "eu-west-2"
  }
}
