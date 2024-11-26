#create VPC
resource "aws_vpc" "dev_local" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "dev_vpc"
    }

  
}


#create subnet
resource "aws_subnet" "dev_local" {
vpc_id = aws_vpc.dev_local.id
cidr_block = "10.0.0.0/24"

tags = {
  Name = "dev_subnet"
}
}


#create Internet Gateway attach to VPC
resource "aws_internet_gateway" "dev_local" {
    vpc_id = aws_vpc.dev_local.id
     
  
}


#create a Route table edit routes
resource "aws_route_table" "dev_rt" {
    vpc_id = aws_vpc.dev_local.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_local.id
    }
}


#subnet association
resource "aws_route_table_association" "dev_local" {
    subnet_id = aws_subnet.dev_local.id
    route_table_id = aws_route_table.dev_rt.id

}


#create Security group
resource "aws_security_group" "all0w_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.dev_local.id
    tags = {
      Name = "dev_sg"
    }
ingress {
        description = "TLS from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
ingress {
    description = "TLS from VPC"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
  
}
  
