# This will create s3 bucket to store the terraform state file 
terraform {
  backend "s3" {
    bucket    = "terraform-p-backend"
    key       = "terraform-project.tfstate"
    region    = "eu-west-2"
    profile   = "default"
  }
}