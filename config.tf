terraform {
  backend "s3" {
    bucket = "zipcode-terraform-state"
    key = "terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
    dynamodb_table = "terraform_state_lock"
  }
}