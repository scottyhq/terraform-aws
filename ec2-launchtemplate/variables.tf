variable "region" {
  default = "us-west-2"
}

variable "profile" {
  default = "default"
}

variable "instance" {
  default = "m5d.2xlarge"
}

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
variable "amis" {
  type = map
  default = {
    "us-east-1" = "ami-097e3d1cdb541f43e"
    "us-west-2" = "ami-0fb71e703258ab7eb"
  }
}
