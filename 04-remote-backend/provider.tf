# Declaring the provider information
provider "aws" {}

## declaring the remote backend as s3
terraform {
  backend "s3" {
    bucket = "b57-tf-state-bucke"
    key    = "dev/ec2/"
  }
}
