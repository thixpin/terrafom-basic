# Define provider
provider "aws" {
  region = "ap-southeast-1"
}

module "my-web-server" {
  source = "./modules/webservice"
  instance_name = "web-server-with-modules"
  # instance_type = "t2.small"
  # ami = "ami-0d07675d294f17973"
  office_cidr = "10.11.12.0/24"
}
