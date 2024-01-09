output "aws_public_instance_dns" {
  value = aws_instance.python-web-project[*].public_dns
}