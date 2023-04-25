resource "aws_instance" "test" {
  ami                    = data.aws_ami.amzn2.id
#  iam_instance_profile   = 
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = data.aws_subnet.build.id
  vpc_security_group_ids = [aws_security_group.test.id]

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = data.vault_generic_secret.kms_data.data.ebs
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type

    tags = {
      Name     = "${var.service}-${var.environment}-01-root"
    }
  }

  tags = {
    Name       = "${var.service}-${var.environment}-01"
    Terraform  = "true"
    Concourse  = "new"
    ReleaseTag = var.release_tag
  }
}

resource "aws_security_group" "test" {
  name        = "sgr-${var.service}-${var.environment}-01"
  description = "Security group for ${var.service}-${var.environment}-01"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    prefix_list_ids = []
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
