resource "aws_instance" "python-web-project" {
  ami               = "ami-0d118c6e63bcb554e"
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  subnet_id         = aws_subnet.terraform-subnet-public.id

  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  key_name = var.key_name
  tags     = local.resource_tags
}