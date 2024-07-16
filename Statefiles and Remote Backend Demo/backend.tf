terraform {
  backend "s3" {
    bucket         = "s3-bucket-for-backend-1" # change this
    key            = "sam/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
