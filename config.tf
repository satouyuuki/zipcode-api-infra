terraform {
  backend "s3" {
    bucket = "terraform-file"
    key = "dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}