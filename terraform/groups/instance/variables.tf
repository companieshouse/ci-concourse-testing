variable "aws_account" {
  type        = string
  description = "AWS account name"
}

variable "aws_region" {
  type        = string
  description = "AWS region to operate in"
}

variable "environment" {
  type        = string
  description = "The name of the deployment environment"
}

variable "service" {
  type        = string
  description = "Deployment service name"
  default     = "ci-concourse-testing"
}

# EC2 Vars
variable "ami_base_name_prefix" {
  type        = string
  description = "Base AMI name prefix, will be used to form search strings and regexes when filtering for AMIs"
  default     = "amzn2-base"
}

variable "build_subnet_prefix" {
  type        = string
  description = "Base subnet name prefix, will be used to form search strings and regexes when filtering for subnets"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Name of an existing SSH keypair to use on the EC2 instance"
}

variable "release_tag" {
  type        = string
  description = "Github release tag that the code is deployed from"
}

variable "root_volume_size" {
  type        = number
  description = "Size, in GiB, for the root EBS volume"
  default     = 20
}

variable "root_volume_type" {
  type        = string
  description = "EBS volume type for the EC2 root volume"
  default     = "gp2"
}
