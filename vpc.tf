resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name= "main-practice"
    tag-key = "vpc-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

 tags = {
    name= "main-practice"
    tag-key = "gw-1"
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

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  } 
  tags = {
    name= "main-practice"
    tag-key = "public_route_table-1"
    Environment = "Practice"
    Managed_by = var.managed_by
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_vpc.main.id


  // inbound rule
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  // outbound rule
  egress  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    name= "main-practice"
    tag-key = "SG-Allow-All-TLS1"
    Environment = "Practice"
    Managed_by = var.managed_by
  } 
}