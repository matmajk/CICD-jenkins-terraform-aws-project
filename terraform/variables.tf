variable "aws_region" {
  type = string
  description = "Region used for AWS resources"
  default = "eu-central-1"
}

variable "availability_zone" {
  type = "string"
  default = "eu-central-1a"
}

variable "user" {
  type = "string"
  default = "ubuntu"
}

variable "instance_type" {
  type = "string"
  description = "EC2 Instance type"
  default = "t2.micro"
}

variable "aws_access_key" {
  type = "string"
  description = "Access key for AWS"
  sensitive = "true"
}

variable "aws_secret_key" {
  type = "string"
  descriptions = "Secret key for AWS"
  sensitive = "true"
}