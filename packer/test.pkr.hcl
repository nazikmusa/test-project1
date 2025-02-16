packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# variable "ami_name" {
#   default = "wordpress-ami"
# }

# variable "instance_type" {
#   default = "t2.micro"
# }

# variable "region" {
#   default = "us-east-2"
# }

source "amazon-ebs" "wordpress" {
  ami_name      = var.ami_name
  instance_type = var.instance_type
  region        = var.region
  ssh_username = "ec2-user"
  source_ami_filter {
    filters = {
      name                = "al2023-ami-2023.6.20250203.1-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["137112412989"]
  }
  tags = {
    Name = "WordPress-AMI"
  }
  
}

build {
  name = "wordpress"
  sources = [
    "source.amazon-ebs.wordpress"
  ]

  provisioner "shell" { 
    script = "wordpress.sh"
  }
}
