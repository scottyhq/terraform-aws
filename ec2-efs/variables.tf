variable "region" {
  default = "us-east-1"
}

variable "az" {
  default = "us-east-1a"
}

variable "profile" {
  default = "default"
}

variable "key" {
  default = "eks-pangeo-nasa-us-east-1"
}

variable "instance" {
  default = "t3a.medium"
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
