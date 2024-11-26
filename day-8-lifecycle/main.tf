resource "aws_instance" "test" {
    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"

    tags = {
      Name = "test"
    }
  
}

#lifecycle {
#    create_before_destroy = true
#}


#lifecycle {
#   prevent_destroy = true
#}

#lifecycle {
#   ignore_changes = [tags,]
#}