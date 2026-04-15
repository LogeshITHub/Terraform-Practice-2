resource "aws_s3_bucket" "terraform-bucket-1" {
  bucket = "2026-04-13-s3-bucket-1"

  tags = {
    Name        = "terraform-bucket-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}