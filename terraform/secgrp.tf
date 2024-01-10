resource "aws_security_group" "terraform-sg" {
  vpc_id      = var.vpc_id
  name        = "terraform-sg"
  description = "Security group for MyIP SSH and for traffic from anywhere"

  ingress {
    description = "SSH connection from MyIP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr_route]
  }

  ingress {
    description = "HTTP access from anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [var.default_cidr_route]
  }

  egress {
    description = "Outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.default_cidr_route]
  }

  tags = local.resource_tags
}
