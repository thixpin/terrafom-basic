terraform {
  backend "s3" {
    bucket = "test-devktops-tf"
    key    = "web-server/backend.tfstate"
    region = "ap-southeast-1"
  }
}