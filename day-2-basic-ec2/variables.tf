variable "ami" {
    description = "passing ami value"
    type = string
    default = ""
  
}
variable "instance_type" {
    type = string
    default = ""
  
}
variable "key_name" {
    type = string
    default = ""
  
}
variable "name" {
  description = "The name of the EC2 instance."
  default = ""
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in"
  type        = string
}
