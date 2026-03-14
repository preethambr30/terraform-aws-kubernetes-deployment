resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "preetham-devops-terraform-state"

  tags = {
    Name = "terraform-state"
  }
}
