terraform {
backend "s3" {
    bucket         = "02.terraform.bucket"  
    region         = "ap-south-1"
    key            = "terraform.tfstate" 
    dynamodb_table = "terraform-state-lock-dynamo" 
    encrypt        = true  
}
}