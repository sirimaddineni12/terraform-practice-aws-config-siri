resource "aws_s3_bucket" "name" {
    bucket = "9676.new.bucket"
  
}




terraform {
  backend "s3" {
    bucket = "my.terraform.bucket.in.vs"
    region = "ap-south-1"
    key = "terraform.tfstate"
    encrypt = true
    
  }
}