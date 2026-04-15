resource "aws_iam_user" "user-1" {
  name = "terraform-user-1"
  path = "/"

  tags = {
    tag-key = "terraform-user-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}