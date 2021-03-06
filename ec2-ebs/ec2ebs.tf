# Initialization
# ==============
terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.51.0"
  region  = var.region
  profile = var.profile
}


# VPC and security groups
# ----------
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ecs-test" {
  name        = "ecs-test"
  description = "Allow SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Don't leave open for long periods of time
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Intance w/ ECS-optimized AMI for dinosar testing
# ----------
resource "aws_instance" "ecs-optimized" {
  ami                    = var.amis[var.region]
  instance_type          = var.instance
  key_name               = "pangeo-access-us-west-2"
  vpc_security_group_ids = [aws_security_group.ecs-test.id]
  user_data              = file("mount_volume.sh")

  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "dinosar ebs machine"
  }
}
