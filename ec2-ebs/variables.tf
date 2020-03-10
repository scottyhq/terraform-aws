variable "region" {
  default = "us-west-2"
}

variable "profile" {
  default = "default"
}

variable "instance" {
  default = "m5d.xlarge"
}

# Make larger than 8GB to simplify mount script
variable "volume_size" {
  default = 100
}

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
# March 2020
variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-098616968d61e549e"
    "us-west-2" = "ami-014a2e30da708ee8b"
  }
}
