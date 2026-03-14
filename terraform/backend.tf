terraform {
  backend "s3" {
    bucket         = "preetham-devops-terraform-state"
    key            = "devops-project/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
