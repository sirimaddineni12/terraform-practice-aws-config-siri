resource "aws_instance" "myvm" {
    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    tags = {
      Name = "terraform-instance"
    }
  
}

resource "aws_s3_bucket" "dev" {
  bucket = "01.terraform.bucket"
}