data "aws_ami" "amzn2" {
  owners      = [data.vault_generic_secret.account_ids.data["development"]]
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_base_name_prefix}-*"]
  }
}

data "aws_ec2_managed_prefix_list" "admin" {
  filter {
    name   = "prefix-list-name"
    values = ["administration-cidr-ranges"]
  }
}

data "aws_subnet" "build" {
  filter {
    name   = "tag:Name"
    values = ["${var.build_subnet_prefix}-c"]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.aws_account}"]
  }
}

data "vault_generic_secret" "account_ids" {
  path = "aws-accounts/account-ids"
}

data "vault_generic_secret" "kms_data" {
  path = "aws-accounts/${var.aws_account}/kms"
}
