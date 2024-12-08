variable "instance_type" {
  description   = "The type of EC2 instance to launch"
  type          = string
  default       = "t2.micro"
}

variable "ami" {
  description   = "The AMI to use for the EC2 instance"
  type          = string
  default       = "ami-0d07675d294f17973"
}

variable "instance_name" {
  description   = "The name of the EC2 instance"
  type          = string
  default       = "web-server"
}

variable "office_cidr" { 
    description = "value of the office CIDR block"
    type = string
    default = "103.121.158.0/24"
}

variable "security_group_name" {
    description = "Name of the security group"
    type = string
    default = "webserver-module-sg"
}