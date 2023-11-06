locals {
  resource_tags = {
    company      = var.company
    project_name = "${var.company}-${var.project}"
    category     = var.category
    Name         = var.instance_name
  }
}