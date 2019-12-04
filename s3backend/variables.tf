variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-west-2"
}

variable "bucket_name" {
  default = "terraform-pangeo-access-state"
}

variable "dynamo_table_name" {
  default = "terraform-pangeo-access-locks"
}
