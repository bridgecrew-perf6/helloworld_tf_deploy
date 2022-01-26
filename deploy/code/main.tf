terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
  }

}

module "s3backend" {
   source = "github.com/victorbecerragit/terraform-aws-s3backend"
}

provider "aws" {
  region = "us-east-2" # <<<<< Try changing this to eu-west-1 to compare the costs
}

data "aws_ami" "ubuntu" {
  most_recent = true
 
  filter {
  name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
 
  owners = ["099720109477"]
}

resource "aws_instance" "web_app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro" # <<<<< Try changing this to m5.8xlarge to compare the costs

  root_block_device {
    volume_size = 50
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "io1" # <<<<< Try changing this to gp2 to compare costs
    volume_size = 1000
    iops        = 800
  }
}

 
