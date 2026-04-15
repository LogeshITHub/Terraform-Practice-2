resource "aws_instance" "web-server-1" {
  ami           = "ami-048f4445314bcaa09"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet_1.id
  key_name      = "EC2-Key"
  associate_public_ip_address = true 
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]

  tags = {
    Name = "terraform-ec2-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}
