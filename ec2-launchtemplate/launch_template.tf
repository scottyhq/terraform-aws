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


# Create launch template
# ----------------------
resource "aws_launch_template" "dinosar" {
  name          = "dinosar"
  image_id      = var.amis[var.region]
  instance_type = var.instance
  key_name      = "pangeo-access-us-west-2.pem"
  #  vpc_security_group_ids = ["sg-12345678"]
  #  user_data = "${base64encode(...)}"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 50
      delete_on_termination = true
    }
  }

  #  instance_market_options {
  #    market_type = "spot"
  #  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "dinosar"
    }
  }

}

# Use launch template to spin up instance
# ---------------------------------------
#Waiting for https://github.com/terraform-providers/terraform-provider-aws/pull/10807
