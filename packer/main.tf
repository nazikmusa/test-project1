provider "aws" {
  region = var.region
}

resource "aws_key_pair" "group-2" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}