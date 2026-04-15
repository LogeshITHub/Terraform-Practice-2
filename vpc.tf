resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name= "main-practice"
    tag-key = "vpc-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name= "public_subnet_1"
    tag-key = "public_subnet_1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    name= "private_subnet_1"
    tag-key = "private_subnet_1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}