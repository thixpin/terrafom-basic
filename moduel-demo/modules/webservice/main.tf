# Define provider
provider "aws" {
  region = "ap-southeast-1"
}

# Create a Security Group for an EC2 instance
resource "aws_security_group" "webserver_sg" {
  name = "${var.security_group_name}"
  
  ingress {
    from_port	  = 80
    to_port	    = 80
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  ingress {
    from_port	  = 443
    to_port	    = 443
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  ingress {
    from_port	  = 22
    to_port	    = 22
    protocol	  = "tcp"
    cidr_blocks	= ["${var.office_cidr}"]
  }

  egress {
    from_port	  = 0
    to_port	    = 0
    protocol	  = "-1"
    cidr_blocks	=  ["0.0.0.0/0"]
  }
}

# Define resource
resource "aws_instance" "web_server" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.webserver_sg.id}"]

  tags = {
    Name = "${var.instance_name}"
  }

  user_data = <<-EOF
      #!/bin/bash
      yum install -y httpd
      echo "Hello, World!" > /var/www/html/index.html
      systemctl start httpd
      EOF


}

