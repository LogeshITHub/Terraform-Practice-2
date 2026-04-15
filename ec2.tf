resource "aws_instance" "web-server-1" {
  ami           = "ami-048f4445314bcaa09"
  instance_type = var.instance_type
  subnet_id     = "subnet-06f71a4888ba4e420" 
  key_name      = "EC2-Key"
  associate_public_ip_address = true 
  vpc_security_group_ids      = ["sg-00df5e72c8c40220e"]

  tags = {
    Name = "terraform-ec2-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}

