variable "aws_region" {
  type        = string
  description = "Region used for AWS resources"
  default     = "eu-central-1"
}

variable "availability_zone" {
  type    = string
  default = "eu-central-1a"
}

variable "user" {
  type    = string
  default = "ubuntu"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance type"
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "EC2 Instance name"
  default     = "terraform-instance"
}

#variable "aws_access_key" {
#  type        = string
#  description = "Access key for AWS"
#  sensitive   = "true"
#}
#
#variable "aws_secret_key" {
#  type        = string
#  description = "Secret key for AWS"
#  sensitive   = "true"
#}

variable "key_name" {
  type        = string
  description = ".ppk / .pem Key name "
  default     = "jenkins-master"
}

variable "default_cidr_route" {
  type        = string
  description = "Default route CIDR"
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
  default     = "vpc-0a9756a8617a9f037"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR block for VPC"
  default     = "172.31.0.0/16"
}

variable "vpc_subnet_cidr_block" {
  type        = string
  description = "CIDR block for subnet in VPC"
  default     = "172.31.64.0/20"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP for Subnet instance"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
}

variable "category" {
  type        = string
  description = "Category for resource tagging"
}