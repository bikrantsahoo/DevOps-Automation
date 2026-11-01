terraform {
  backend "s3" {
    bucket         = "bikrant-terraform-state-2026-unique"
    key            = "devops-assignment/task1/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
