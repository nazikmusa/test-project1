variable "ami_name" {
  default = "wordpress-ami"
}
variable "instance_type" {
  default = "t2.micro"
}
variable region {
    default = "us-east-2"
}
variable "key_name" {
    default = "group-2"
}

variable "vpc_cidr"  {
 default = "10.0.0.0/16"
}

variable subnet1 {
    default = "10.0.1.0/24"
}
variable subnet2 {
    default = "10.0.2.0/24"
}
variable subnet3 {
    default = "10.0.3.0/24"
}
variable port {
    default = [22, 80]
}
variable "instance_name" {
    default = "wordpress"
}