variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "c7i-flex.large"
}

variable "key_name" {
  description = "Existing AWS key pair name"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
