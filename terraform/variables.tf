variable "image_tag_mutability" {
  default = "MUTABLE"
}

variable "cluster_name" {
  default = "coda-payment"
}

variable "environment" {
  default = "dev2"
}

variable "application" {
  default = "rest-api"
}

variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "availability_zone2" {
  default = "us-east-1b"
}

variable "desired_capacity" {
  default = 2
}

variable "max_capacity" {
  default = 2
}

variable "min_capacity" {
  default = 2
}

variable "node_lifecycle" {
  type    = string
  default = "spot"
}

